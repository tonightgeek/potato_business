package com.jujiao.business

class Member {

    String mobile
    String address
    String uniqueId
    String firstName
    String lastName
    boolean isValid = true


    MemberSource memberSource
    Date dateCreated
    Date lastUpdated

    public enum MemberSource {
        CALL_CENTER,WECHAT
    }

    static constraints = {
        uniqueId nullable: true,blank: true
    }

    static mapping = {
    }
}
