package com.jujiao.business

import com.jujiao.business.utils.OrderReminderUtils
import com.jujiao.business.utils.OrderSeriesUtils

class Orders {

    String code
    Float totalPrice
    String address
    String phone
    String contactName
    Date sendDate
    OrderStatus orderStatus
    OrderSource orderSource
    String remark
    String cancelReason
    String orderSeries

    boolean hasPrinted = false
    boolean isMemberFirstOrder = false

    Member member
    static hasMany = [orderItem:OrderItem]

    Date dateCreated
    Date lastUpdated


    public enum OrderSource {
        WECHAT_DECUTATION_2('微信减2元'),CALL_CENTER('呼叫中心')

        public displayValue

        OrderSource(String displayValue = '') {
            this.displayValue = displayValue
        }

        public String getDisplayValue() {
            return this.displayValue
        }


    }

    public enum OrderStatus {
        PLACE('下单'), PLACEHOLD1, PLACEHOLD2, PLACEHOLD3, PLACEHOLD4, PLACEHOLD5, PLACEHOLD6, PLACEHOLD7, PLACEHOLD8, PLACEHOLD9, PLACEHOLD10, PLACEHOLD11
        , PLACEHOLD12, PLACEHOLD13, PLACEHOLD14, PLACEHOLD15, PLACEHOLD16, PLACEHOLD17, PLACEHOLD18
        , PLACEHOLD19, PLACEHOLD20, PLACEHOLD21, COMPLETE('完成'), CANCEL('取消')

        String displayValue

        OrderStatus(String displayValue = '') {
            this.displayValue = displayValue
        }

        public String getDisplayValue() {
            return this.displayValue
        }

    }

    def afterInsert = {
        def orderPrint = new OrderPrint(orderCode: this.code,hasPrint: false)
        orderPrint.save()

        if(Orders.countByMemberAndIsMemberFirstOrder(this.member,true)==0){
            this.isMemberFirstOrder =true
        }

        String series = "0000"+OrderSeriesUtils.increaseAndGetOrderSeries()
        this.orderSeries = series.substring(series.size()-4)
        OrderReminderUtils.increaseReminder()
    }

    static constraints = {
        remark nullable: true,blank: true
        cancelReason nullable: true,blank: true
        hasPrinted nullable:true,blank:true
        orderSeries nullable: true,blank: true
    }

    static mapping = {
        autoTimestamp true
        remark type: 'text'
        code length: 20
        address length: 100
        contactName length: 20
        phone length: 20
        orderStatus(enumType: "ordinal")
        sort dateCreated: "desc"
        orderSource length: 20
        orderSeries length: 20
    }
}
