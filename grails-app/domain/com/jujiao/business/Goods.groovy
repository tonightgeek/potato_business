package com.jujiao.business

class Goods {

    String goodsCode
    String goodName
    Float salePrice
    Float basePrice
    String iconPath
    String description
    String sendScope
    GoodsStatus goodsStatus = GoodsStatus.ON_SALE

    Date dateCreated
    Date lastUpdated

    public enum GoodsStatus{
        ON_SALE,OFF_SALE
    }


    static constraints = {
        sendScope nullable: true,blank: true
        iconPath nullable: true,blank: true
        salePrice nullable: true,blank: true
    }

    static mapping = {
        autoTimestamp true
        sort dateCreated: "desc"

    }
}
