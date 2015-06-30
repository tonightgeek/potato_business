package com.jujiao.business

class Orders {

    String code
    Float totalPrice
    String address
    String phone
    String contactName
    Date sendDate

    Member member
    static hasMany = [orderItem:OrderItem]

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        autoTimestamp true
    }
}
