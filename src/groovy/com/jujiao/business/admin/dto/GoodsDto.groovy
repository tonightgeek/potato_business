package com.jujiao.business.admin.dto

import com.jujiao.business.Goods

class GoodsDto {

    String goodsCode
    String goodName
    Float salePrice
    Float basePrice
    String iconPath
    String description
    String status
    String sendScope
    int inventory

    boolean needSauce
    boolean needDrink

    public static GoodsDto fromGoods(Goods goods) {
        return [goodsCode:goods.goodsCode,goodName:goods.goodName,basePrice:goods.basePrice,salePrice:goods.salePrice,
                iconPath:goods.iconPath,description:goods.description,status:goods.goodsStatus.displayValue,inventory:goods.inventory,
                needSauce:goods.needSauce,needDrink:goods.needDrink] as GoodsDto

    }
}
