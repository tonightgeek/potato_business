package com.jujiao.business.admin

import com.jujiao.business.Goods
import grails.transaction.Transactional

@Transactional
class GoodsService {

    def update(request,params) {
        def goods = Goods.findByGoodsCode(params.code)
        if (goods) {

            goods.goodName = params.names
            goods.price = params.price.toFloat()
            goods.description = params.description

            if (params.goodsStatus) {
                goods.goodsStatus = Goods.GoodsStatus.ON_SALE
            }
            else {
                goods.goodsStatus = Goods.GoodsStatus.OFF_SALE
            }

            def file = request.getFile('file')
            if (file && file.getSize() > 0) {
                def suffix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf(".")+1)
                def fileName = goods.goodsCode+"."+suffix
                file.transferTo(new File(grailsApplication.config.goods.img.path+"/"+fileName));
                goods.iconPath = fileName
            }
            goods.save()
        }
    }
}
