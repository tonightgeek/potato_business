package com.jujiao.business.admin

import com.jujiao.business.Goods
import com.jujiao.business.Member
import com.jujiao.business.OrderItem
import com.jujiao.business.OrderPrint
import com.jujiao.business.Orders
import com.jujiao.business.admin.command.OrderCommand
import com.jujiao.business.common.CommonUtils
import grails.transaction.Transactional
import org.apache.commons.logging.LogFactory

@Transactional
class OrderService {

    private static final log = LogFactory.getLog(this)

    def saveOrder(OrderCommand orderCommand,Member member) {

        try {
            def commandOrderItems = orderCommand.orderItemCommandList
            def orderItems = []
            def totalPrice = 0.0
            commandOrderItems.each { it ->
                if(it){
                    def g = Goods.findByGoodsCode(it.goodsCode)
                    if (g) {
                        def orderItem = new OrderItem(goods: g, orderName: g.getGoodName(), totalPrice:
                                g.getBasePrice() * it.goodsCount.toInteger(), count: it.goodsCount.toInteger())
                        orderItems.add(orderItem)
                        totalPrice += orderItem.totalPrice
                    }
                }
            }

            def order = new Orders(orderSource: Orders.OrderSource.CALL_CENTER, member: member, code: CommonUtils.generateSixCode()
                    , totalPrice: totalPrice, address: orderCommand.orderAddress,
                    phone: orderCommand.orderPhone, contactName: orderCommand.orderContact, sendDate: new Date(orderCommand.time),
            remark: orderCommand.remark,orderStatus: Orders.OrderStatus.PLACE)
            orderItems.each {
                order.addToOrderItem(it)
            }
            order.save()

            new OrderPrint(orderCode: order.code,hasPrint: true).save()

            return order.getCode()
        } catch (Exception e) {
            log.error(e)
            throw e
        }
    }
}
