package com.jujiao.business.admin.dto

import com.jujiao.business.Goods

class GoodsDto {

    String goodsCode
    String goodName
    Float price
    String iconPath
    String description
    String status
    String sendScope

    public static GoodsDto fromGoods(Goods goods) {
        return [goodsCode:goods.goodsCode,goodName:goods.goodName,price:goods.price,
                iconPath:goods.iconPath,description:goods.description] as GoodsDto

    }
}
