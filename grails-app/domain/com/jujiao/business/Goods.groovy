package com.jujiao.business

class Goods {

    String goodName
    Float price
    String iconPath

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        autoTimestamp true
    }
}
