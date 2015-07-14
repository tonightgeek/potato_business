package com.jujiao.business.admin

import com.jujiao.business.Goods
import com.jujiao.business.admin.dto.GoodsDto
import com.jujiao.business.common.CommonResult
import com.jujiao.business.utils.CommonUtils
import grails.converters.JSON
import grails.gorm.DetachedCriteria
import org.apache.commons.logging.LogFactory

class GoodsController {
    GoodsService goodsService
    static namespace = "admin"
    private static final log = LogFactory.getLog(this)

    def index() {
        render(view: "/admin/order/goods")
    }

    def list() {
        def orderBy;
        def sort;

        if (params.order) {
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
        if (params.filterOffSale) {
            detachedCriteria = detachedCriteria.build {
                eq "goodsStatus",'ON_SALE'
            }
        }
        List<Goods> goodsList = detachedCriteria.list([max: params.length, offset: params.start, sort: sort, order: orderBy])
        CommonResult<List<GoodsDto>> results = new CommonResult<List<GoodsDto>>()
        List<GoodsDto> goodsDtoList = new ArrayList<GoodsDto>(goodsList.size())
        try {
            goodsList.each { goods ->

                def goodsDto = GoodsDto.fromGoods(goods)
                goodsDtoList.add(goodsDto)
            }

            results.data = goodsDtoList
//            results.currentPage = params.page
            results.recordsTotal = totalRecords
            results.recordsFiltered = totalRecords
        }
        catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
            log.error(e)
        }

        render results as JSON
    }

    def get() {
        CommonResult<GoodsDto> results = new CommonResult<GoodsDto>()
        try {
            def goods = Goods.findByGoodsCode(params.code)
            if (goods) {

                results.setData(GoodsDto.fromGoods(goods))

            }
        } catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
            log.error(e)
        }
        render results as JSON

    }

    def save() {

        def result = "success"
        try {
            def goodsCode = CommonUtils.generateSixCode()
            def goods = new Goods(goodsCode: goodsCode,
                    goodName: params.names, basePrice: params.basePrice,salePrice:params.salePrice, description: params.description
            )
            goods.save()

            def file = request.getFile('file')
            if (file && file.getSize() > 0) {
                def suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1),
                fileName = goodsCode + "." + suffix
                file.transferTo(new File(grailsApplication.config.goods.img.path + "/" + fileName));
                goods.iconPath = fileName
                goods.save(flush:true)
            }
        }
        catch (Exception e) {
            result = "error"
            log.error(e)
        }

        render result
    }

    def update() {
        CommonResult<GoodsDto> results = new CommonResult<GoodsDto>()
        try {
            goodsService.update(request,params,grailsApplication.config.goods.img.path)
        } catch (Exception e) {
            log.error(e)
            results.result = CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON
    }

    def offGoods() {
        CommonResult<Boolean> result = new CommonResult<Boolean>()

        try {
            def goods = Goods.findByGoodsCode(params.code)
            if (goods) {
                goods.goodsStatus = Goods.GoodsStatus.OFF_SALE
                goods.save(flush: true)
            }
        } catch (Exception e) {
            log.error(e)
            result.result = CommonResult.CommonResultStatus.FAIL
        }

        render result as JSON
    }

    def onsale() {
        CommonResult<Boolean> result = new CommonResult<Boolean>()

        try {
            def goods = Goods.findByGoodsCode(params.code)
            if (goods) {
                goods.goodsStatus = Goods.GoodsStatus.ON_SALE
                goods.save(flush: true)
            }
        } catch (Exception e) {
            log.error(e)
            result.result = CommonResult.CommonResultStatus.FAIL
        }

        render result as JSON
    }
}
