package com.jujiao.business.wechat

import com.jujiao.business.Goods
import com.jujiao.business.admin.dto.GoodsDto
import com.jujiao.business.common.CommonResult
import org.apache.commons.logging.LogFactory

class GoodsController {

    static namespace = "wechat"

    def index() {}

    private static final log = LogFactory.getLog(this)

    def list() {
        CommonResult<List<GoodsDto>> result = new CommonResult<List<GoodsDto>>()

        try {
            def goodsList = Goods.list()
            def goodsDtoList = []

            goodsList.each { it ->
                goodsDtoList.add(GoodsDto.fromGoods(it))
            }
            result.data = goodsDtoList
        } catch (Exception e) {
            result.result = CommonResult.CommonResultStatus.FAIL
            log.error(e)
        }

        return result
    }
}
