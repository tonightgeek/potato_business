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

    public static GoodsDto fromGoods(Goods goods) {
        def status = '销售中'

        if (goods.goodsStatus == Goods.GoodsStatus.OFF_SALE) {
            status = '下架'
        }

        return [goodsCode:goods.goodsCode,goodName:goods.goodName,basePrice:goods.basePrice,salePrice:goods.salePrice,
                iconPath:goods.iconPath,description:goods.description,status:status] as GoodsDto

    }
}
