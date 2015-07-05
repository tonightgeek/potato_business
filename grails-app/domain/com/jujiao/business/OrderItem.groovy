package com.jujiao.business


class OrderItem {

    String orderName
    int count
    Double totalPrice
    Goods goods

    Orders order
    Date dateCreated
    Date lastUpdated


    static constraints = {
    }

    static mapping = {
    }
}
