package com.jujiao.business

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

    boolean hasPrinted = false

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
    }

    static constraints = {
        remark nullable: true,blank: true
        cancelReason nullable: true,blank: true
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
    }
}
