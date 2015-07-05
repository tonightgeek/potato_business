package com.jujiao.business.admin

import com.jujiao.business.Member
import com.jujiao.business.admin.command.OrderCommand
import com.jujiao.business.common.CommonResult
import com.jujiao.business.Orders
import com.jujiao.business.admin.dto.OrderDto
import grails.converters.JSON
import grails.gorm.DetachedCriteria

import javax.persistence.criteria.Order

class OrderController {

    static namespace = "admin"

    def orderService

    def index() {
        render(view: "/admin/order/index")
    }

    def save(OrderCommand orderCommand) {
        CommonResult<Boolean> results = new CommonResult<Boolean>()
        try {
            def member = Member.get(orderCommand.getMemberId())
            if (!member) {
                member = new Member(mobile: orderCommand.memberMobile, address: orderCommand.memberAddress,
                        firstName: orderCommand.memberFirstName, lastName: orderCommand.memberLastName,
                        memberSource: Member.MemberSource.CALL_CENTER
                ).save()
            } else {
                member.mobile = orderCommand.memberMobile
                member.address = orderCommand.memberAddress
                member.firstName = orderCommand.memberFirstName
                member.lastName = orderCommand.memberLastName
                member.save(flush: true)
            }

            orderCommand.time = ((new Date()).format("yyyy:MM:dd")) + " " + orderCommand.getTime()
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
        List<OrderDto> orderDtoList = new ArrayList<OrderDto>(orders.size())
        try {
            orders.each { order ->
                def orderDto = [code:order.code,totalPrice:order.totalPrice,
                 address:order.address,phone:order.phone,dateCreated:order.dateCreated.format("yyyy-MM-dd HH:mm:ss"),
                 sendDate:order.sendDate.format("yyyy-MM-dd HH:mm:ss"),contactName:order.contactName,orderStatus:order.orderStatus.displayValue] as OrderDto
                orderDtoList.add(orderDto)
            }

            results.data = orderDtoList
//            results.currentPage = params.page
            results.recordsTotal = totalRecords
            results.recordsFiltered = totalRecords
        }
        catch (Exception e) {
            results.result=CommonResult.CommonResultStatus.FAIL
        }

        render results as JSON
    }
}
