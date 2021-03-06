package com.jujiao.business.admin

import com.jujiao.business.Goods
import grails.transaction.Transactional

@Transactional
class GoodsService {

    def update(request,params,rootDict) {
        def goods = Goods.findByGoodsCode(params.code)
        if (goods) {

            goods.goodName = params.names
            goods.basePrice = params.basePrice.toFloat()
            goods.salePrice = params.salePrice.toFloat()
            goods.description = params.description

            if (params.goodsStatus == "ON_SALE") {
                goods.goodsStatus = Goods.GoodsStatus.ON_SALE
            }
            else if (params.goodsStatus == "OFF_SALE"){
                goods.goodsStatus = Goods.GoodsStatus.OFF_SALE
            }
            if (params.goodsStatus == "OVER_SALE") {
                goods.goodsStatus = Goods.GoodsStatus.OVER_SALE
            }

            goods.needSauce = params.needSauce
            goods.needDrink = params.needDrink

            def file = request.getFile('file')
            if (file && file.getSize() > 0) {
                def originalPath = goods.iconPath
                if (originalPath) {
                    new File(rootDict+"/" + originalPath).delete()
                }

                def suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1)
                def fileName = goods.goodsCode+"."+suffix
                file.transferTo(new File(rootDict+"/"+fileName));
                goods.iconPath = fileName
            }
            goods.save()
        }
    }
}
