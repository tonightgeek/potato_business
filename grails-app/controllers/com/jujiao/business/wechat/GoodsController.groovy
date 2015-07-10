package com.jujiao.business.wechat

import com.jujiao.business.Goods

class GoodsController {

    def index() {}

    def list() {
        def goodsList = Goods.list()

        goodsList.each {it->
            
        }
    }
}
