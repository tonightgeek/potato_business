package com.jujiao.business

class OrderProcess {

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        autoTimestamp true
    }
}
