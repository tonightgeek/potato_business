package com.jujiao.business.admin

import com.jujiao.business.Member
import com.jujiao.business.OrderPrint
import com.jujiao.business.admin.command.OrderCommand
import com.jujiao.business.admin.dto.OrderItemDto
import com.jujiao.business.common.CommonResult
import com.jujiao.business.Orders
import com.jujiao.business.admin.dto.OrderDto
import com.jujiao.business.utils.OrderReminderUtils
import grails.converters.JSON
import grails.gorm.DetachedCriteria
import org.apache.commons.logging.LogFactory


class OrderController {

    private static final log = LogFactory.getLog(this)
    static namespace = "admin"

    def orderService

    def index() {
        def needPrintCount = OrderPrint.countByHasPrint(false)
            render(view: "/admin/order/index",model:[needPrintCount:needPrintCount])
    }

    def save(OrderCommand orderCommand) {
        CommonResult<Boolean> results = new CommonResult<Boolean>()
        try {
            def member = Member.findByMobile(orderCommand.getOrderPhone())
            if (!member) {
                member = new Member(mobile: orderCommand.orderPhone, address: orderCommand.orderAddress,
                        userName:orderCommand.orderContact,
                        memberSource: Member.MemberSource.CALL_CENTER
                ).save()
            } else {
                if (orderCommand.isShouldChangeMemberAddress()) {
                    member.address = orderCommand.getOrderAddress()
                }
                if (orderCommand.isShouldChangeMemberName()) {
                    member.userName = orderCommand.getOrderContact()
                }

                if (orderCommand.isShouldChangeMemberAddress() || orderCommand.isShouldChangeMemberName()) {
                    member.save(flush: true)
                }
            }

            orderCommand.time = ((new Date()).format("yyyy/MM/dd")) + " " + orderCommand.getTime()
            orderService.saveOrder(orderCommand, member)
        } catch (Exception e) {
            results.result= CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON
    }

    def list() {
        def orderBy;
        def sort;
//        if (params.start > 1) {
//            maxNumber = (params.start-1)*params.start
//        }
        if(params.order){
            orderBy = params.order
            sort = params.sort
        }
        else {
            sort = 'dateCreated'
            orderBy = "desc"
        }


        def detachedCriteria = new DetachedCriteria(Orders)


        if (params.startOrderTime) {
            detachedCriteria = detachedCriteria.build {
                ge "dateCreated", new Date(params.startOrderTime)
            }
        }

        if (params.endOrderTime) {
            detachedCriteria = detachedCriteria.build {
                ge "dateCreated", new Date(params.startOrderTime)
            }
        }

        if (params.startSendTime) {
            detachedCriteria = detachedCriteria.build {
                ge "sendDate", new Date(params.startSendTime)
            }
        }

        if(params.endSendTime){
            detachedCriteria = detachedCriteria.build {
                le "sendDate", new Date(params.endSendTime)
            }
        }

        def totalRecords = detachedCriteria.count()
        List<Orders> orders = detachedCriteria.list([max:params.length,offset:params.start,sort:sort,order:orderBy])
        CommonResult<List<OrderDto>> results = new CommonResult<List<OrderDto>>()

        if(orders)
        {
            List<OrderDto> orderDtoList = new ArrayList<OrderDto>(orders.size())
            try {
                orders.each { order ->
                    def orderDto = [code    : order.code, totalPrice: order.totalPrice,
                                    address : order.address, phone: order.phone, dateCreated: order.dateCreated.format("yyyy-MM-dd HH:mm:ss"),
                                    sendDate: order.sendDate.format("yyyy-MM-dd HH:mm:ss"), contactName: order.contactName,
                                    orderStatus: order.orderStatus.displayValue,orderSeries:order.orderSeries
                    ,orderSource:order.orderSource.displayValue,hasPrinted:order.hasPrinted,isMemberFirstOrder:order.isMemberFirstOrder
                    ] as OrderDto
                    orderDtoList.add(orderDto)
                }

                results.data = orderDtoList
                results.recordsTotal = totalRecords
                results.recordsFiltered = totalRecords
            }
            catch (Exception e) {
                results.result=CommonResult.CommonResultStatus.FAIL
                log.error('list order error ',e)
            }
        }
        else {
            results.data = null
            results.recordsTotal = 0
            results.recordsFiltered = 0
        }


        render results as JSON
    }

    def cancelOrder() {
        CommonResult<Boolean> results = new CommonResult<Boolean>()
        try {
            def order = Orders.findByCode(params.code)
            if (order) {
                order.orderStatus = Orders.OrderStatus.CANCEL
            }
            order.save(flush: true)
        } catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
            log.error('cancel order error ',e)
        }
        render results as JSON
    }

    def get() {
        CommonResult<OrderDto> results = new CommonResult<OrderDto>()
        try {
            def order = Orders.findByCode(params.code)
            def orderDto = [code:order.code,phone:order.phone,totalPrice:order.totalPrice,address:order.address,sendDate:order.sendDate.format("yyyy/MM/dd hh:mm:ss")
            ,orderStatus: order.orderStatus.displayValue,contactName: order.contactName,remark:order.remark,orderSource: order.orderSource.displayValue,
            orderSeries:order.orderSeries] as OrderDto
            order.orderItem.each {
                def orderItemDto = [goodsName:it.goods.goodName,count:it.count,totalPrice:it.totalPrice] as OrderItemDto
                orderDto.orderItemDtoList.add(orderItemDto)
            }
            results.data = orderDto
        } catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
            log.error('cancel order error ',e)
        }
        render results as JSON
    }

    def print() {
        try {
            def orderList = []
            if (params.orderCode) {
                def order = Orders.findByCode(params.orderCode)
                def orderDto = [code         : order.code, phone: order.phone, totalPrice: order.totalPrice, address: order.address, sendDate: order.sendDate.format("yyyy/MM/dd hh:mm:ss")
                                , orderStatus: order.orderStatus.displayValue, contactName: order.contactName, remark: order.remark,
                                orderSource: order.orderSource.displayValue,orderSeries:order.orderSeries] as OrderDto
                order.orderItem.each {
                    def orderItemDto = [goodsName: it.goods.goodName, count: it.count, totalPrice: it.totalPrice] as OrderItemDto
                    orderDto.orderItemDtoList.add(orderItemDto)
                }

                OrderPrint orderPrint = OrderPrint.findByOrderCode(order.getCode())
                orderPrint.hasPrint = true
                orderPrint.save(flush: true)


                order.hasPrinted = true
                order.save(flush: true)

                orderList.add(orderDto)
            }
            if (params.printAll) {
                def orderPrintList = OrderPrint.findAllByHasPrint(false,[max: 5, offset: 0])
                for (OrderPrint orderPrint : orderPrintList) {
                    def order = Orders.findByCode(orderPrint.orderCode)
                    if(order && order.orderStatus == Orders.OrderStatus.PLACE)
                    {
                        def orderDto = [code         : order.code, phone: order.phone, totalPrice: order.totalPrice, address: order.address, sendDate: order.sendDate.format("yyyy/MM/dd hh:mm:ss")
                                        , orderStatus: order.orderStatus.displayValue, contactName: order.contactName, remark: order.remark, orderSource: order.orderSource.displayValue
                        ,orderSeries:order.orderSeries] as OrderDto
                        orderList.add(orderDto)
                        order.orderItem.each {
                            def orderItemDto = [goodsName:it.goods.goodName,count:it.count,totalPrice:it.totalPrice] as OrderItemDto
                            orderDto.orderItemDtoList.add(orderItemDto)
                        }
                    }
                    order.hasPrinted = true
                    order.save(flush: true)
                    orderPrint.hasPrint = true
                    orderPrint.save(flush: true)
                }
            }
            render(view: "/admin/order/printpage", model: [orderList: orderList])
        }
        catch (Exception e) {
            log.error(e)
        }
    }

    def getRemark() {
        CommonResult<String> results = new CommonResult<String>()
        try {
            def order = Orders.findByCode(params.orderCode)
            results.data = order.remark

        } catch (Exception e) {
            log.error(e)
            results.result = CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON
    }

    def modifyRemark() {
        CommonResult<Boolean> results = new CommonResult<Boolean>()
        try{
            def order = Orders.findByCode(params.orderCode)
            order.remark = params.remark
            order.save(flush: true)
            results.data=true
        }catch (Exception e) {
            log.error(e)
            results.result = CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON

    }

    def getReminderOrderCount() {
        try {
            def result = OrderReminderUtils.getReminderCount()
            OrderReminderUtils.clearReminderCount()
            render result
        }
        catch (Exception e) {
            log.error("getReminderOrderCount error",e)
        }
    }
}
