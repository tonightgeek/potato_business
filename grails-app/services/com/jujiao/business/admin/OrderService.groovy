package com.jujiao.business.admin

import com.jujiao.business.Goods
import com.jujiao.business.Member
import com.jujiao.business.OrderItem
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
            def commandOrderItems = orderCommand.orderItems
            def orderItems = []
            def totalPrice = 0.0
            commandOrderItems.each { key, value ->
                def g = Goods.get(key)
                if (g) {
                    def orderItem = new OrderItem(goods: g, orderName: g.getGoodName(), totalPrice:
                            g.getPrice() * value.toInteger(), count: value.toInteger()).save()
                    orderItems.add(orderItem)
                    totalPrice += orderItem.totalPrice
                }
            }

            def orders = new Orders(orderSource: Orders.OrderSource.CALL_CENTER, member: member, code: CommonUtils.generateSixCode()
                    , totalPrice: totalPrice, address: orderCommand.orderAddress,
                    phone: orderCommand.orderPhone, contactName: orderCommand.orderContact, orderItems: orderItems, sendDate: orderCommand.time,
            remark: orderCommand.remark)
                    .save()
        } catch (Exception e) {
            log.error(e)
            throw e
        }
    }
}
