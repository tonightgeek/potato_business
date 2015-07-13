package com.jujiao.business

class OrderPrint {

    String orderCode
    boolean hasPrint

    static constraints = {
    }

    static mapping = {
        orderCode length: 20
    }
}
