package com.jujiao.business.admin

import com.jujiao.business.Goods
import com.jujiao.business.admin.dto.GoodsDto
import com.jujiao.business.common.CommonResult
import grails.converters.JSON
import grails.gorm.DetachedCriteria

class GoodsController {

    static namespace = "admin"

    def index() {
        render(view: "/admin/order/goods")
    }

    def list() {
        def orderBy;
        def sort;

        if(params.order){
            orderBy = params.order
            sort = params.sort
        }

        def detachedCriteria = new DetachedCriteria(Goods)
//
//
//        if (params.startOrderTime) {
//            detachedCriteria = detachedCriteria.build {
//                ge "dateCreated", new Date(params.startOrderTime)
//            }
//        }
//
//        if (params.endOrderTime) {
//            detachedCriteria = detachedCriteria.build {
//                le "dateCreated", new Date(params.endOrderTime)
//            }
//        }
//
//        if (params.startSendTime) {
//            detachedCriteria = detachedCriteria.build {
//                ge "sendDate", new Date(params.startSendTime)
//            }
//        }
//
//        if(params.endSendTime){
//            detachedCriteria = detachedCriteria.build {
//                le "sendDate", new Date(params.endSendTime)
//            }
//        }

        def totalRecords = detachedCriteria.count()
        List<Goods> goodsList = detachedCriteria.list([max:params.length,offset:params.start,sort:sort,order:orderBy])
        CommonResult<List<GoodsDto>> results = new CommonResult<List<GoodsDto>>()
        List<GoodsDto> goodsDtoList = new ArrayList<GoodsDto>(goodsList.size())
        try {
            goodsList.each { goods ->
                def goodsDto = [goodsCode:goods.goodsCode,goodName:goods.goodName,
                                price:goods.price, status:goods.goodsStatus
                                ] as GoodsDto
                goodsDtoList.add(goodsDto)
            }

            results.data = goodsDtoList
//            results.currentPage = params.page
            results.recordsTotal = totalRecords
            results.recordsFiltered = totalRecords
        }
        catch (Exception e) {
            results.result=CommonResult.CommonResultStatus.FAIL
        }

        render results as JSON
    }

    def save() {

    }
}
