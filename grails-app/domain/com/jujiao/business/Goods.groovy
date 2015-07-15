package com.jujiao.business

class Goods {

    String goodsCode
    String goodName
    Float salePrice
    Float basePrice
    String iconPath
    String description
    String sendScope
    int inventory
    GoodsStatus goodsStatus = GoodsStatus.ON_SALE

    Date dateCreated
    Date lastUpdated

    public enum GoodsStatus{
        ON_SALE('在售'),OFF_SALE('下架'),OVER_SALE('售罄')

        String displayValue

        GoodsStatus(String displayValue = '') {
            this.displayValue = displayValue
        }

        public String getDisplayValue() {
            return this.displayValue
        }
    }


    static constraints = {
        sendScope nullable: true,blank: true
        iconPath nullable: true,blank: true
        salePrice nullable: true,blank: true
    }

    static mapping = {
        autoTimestamp true
        sort dateCreated: "desc"
        inventory defaultValue:0
    }
}
