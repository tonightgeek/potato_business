package com.jujiao.business.admin

import com.jujiao.business.Goods
import com.jujiao.business.admin.dto.GoodsDto
import com.jujiao.business.common.CommonResult
import com.jujiao.business.common.CommonUtils
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
        List<Goods> goodsList = detachedCriteria.list([max: params.length, offset: params.start, sort: sort, order: orderBy])
        CommonResult<List<GoodsDto>> results = new CommonResult<List<GoodsDto>>()
        List<GoodsDto> goodsDtoList = new ArrayList<GoodsDto>(goodsList.size())
        try {
            goodsList.each { goods ->

                def status = '销售中'

                if (goods.goodsStatus == Goods.GoodsStatus.OFF_SALE) {
                    status = '下架'
                }

                def goodsDto = [goodsCode: goods.goodsCode, goodName: goods.goodName,
                                price    : goods.price, status: status
                ] as GoodsDto
                goodsDtoList.add(goodsDto)
            }

            results.data = goodsDtoList
//            results.currentPage = params.page
            results.recordsTotal = totalRecords
            results.recordsFiltered = totalRecords
        }
        catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
        }

        render results as JSON
    }

    def get() {
        CommonResult<GoodsDto> results = new CommonResult<GoodsDto>()
        try {
            def goods = Goods.findByGoodsCode(params.code)
            if (goods) {

                def goodsDto = [goodsCode: goods.goodsCode, goodName: goods.goodName, price: goods.price, iconPath: goods.iconPath, description: goods.description
                                , status : goods.goodsStatus] as GoodsDto
                results.setData(goodsDto)

            }
        } catch (Exception e) {
            results.result = CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON

    }

    def save() {

        def result = "success"
        try {
            def goodsCode = CommonUtils.generateSixCode()
            def goods = new Goods(goodsCode: goodsCode,
                    goodName: params.names, price: params.price, description: params.description
            )


            goods.save()

            def file = request.getFile('file')
            if (file.getSize() > 0) {
                def suffix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf(".") + 1)
                def fileName = goodsCode + "." + suffix
                file.transferTo(new File(grailsApplication.config.goods.img.path + "/" + fileName));
                goods.iconPath = fileName
                goods.save()
            }
        }
        catch (Exception e) {
            result = "error"
        }

        render result
    }

    def update() {
        CommonResult<GoodsDto> results = new CommonResult<GoodsDto>()
        try {
            goodsService.update(request,params)
        } catch (Exception e) {
            log.error(e)
            results.result = CommonResult.CommonResultStatus.FAIL
        }
        render results as JSON
    }
}
