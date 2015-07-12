package com.jujiao.business

class Member {

    String mobile
    String address
    String unionId
    String userName

    String city
    String province
    MemberSex memberSex

    boolean isValid = true


    MemberSource memberSource
    Date dateCreated
    Date lastUpdated

    public enum MemberSex {
        MALE,FEMALE,UNKNOWN
    }

    public enum MemberSource {
        CALL_CENTER,WECHAT,IMPORT
    }

    static constraints = {
        unionId nullable: true,blank: true
        city nullable: true,blank: true
        province nullable: true,blank: true
        memberSex nullable: true,blank: true
        mobile nullable: true,blank: true
        userName nullable: true,blank: true
        address nullable: true,blank: true
    }

    static mapping = {
    }
}
