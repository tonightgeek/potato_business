package com.jujiao.business

class OrderItem {

    String orderName
    Double itemPrice
    Orders order
    Date dateCreated
    Date lastUpdated


    static constraints = {
    }

    static mapping = {
        autoTimestamp true
    }
}
