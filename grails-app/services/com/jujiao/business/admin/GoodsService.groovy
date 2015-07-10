package com.jujiao.business.admin

import com.jujiao.business.Goods
import grails.transaction.Transactional

@Transactional
class GoodsService {

    def update(request,params,rootDict) {
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
