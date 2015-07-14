package com.jujiao.business

import com.jujiao.business.admin.dto.GoodsDto
import com.jujiao.business.common.CommonResult
import com.jujiao.business.utils.CommonUtils
import com.jujiao.business.utils.OrderReminderUtils
import com.jujiao.business.wechat.dto.StartOrderDto
import com.jujiao.business.wechat.dto.StartOrderItemDto
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

class WebController {

    private static final log = LogFactory.getLog(this)
    def index() {
        render(view:"/wechat/index")
    }

    def listgoods() {
        CommonResult<List<GoodsDto>> result = new CommonResult<List<GoodsDto>>()
        try {
            def goodsList = Goods.findAllByGoodsStatus("ON_SALE",[sort:"dateCreated",order:"desc"])
            def goodsDtoList = []

            goodsList.each { it ->
                goodsDtoList.add(GoodsDto.fromGoods(it))
            }
            result.data = goodsDtoList
        } catch (Exception e) {
            result.result = CommonResult.CommonResultStatus.FAIL
            log.error("listgoods error",e)
        }

        render result as JSON
    }

    def startorder() {
        CommonResult<StartOrderDto> result = new CommonResult<StartOrderDto>()

        try {
            def goodscodeList = params.goodscode.split(",")
            StartOrderDto data = new StartOrderDto()
            String unionid = CommonUtils.getCookieValue(request,"unionid")
            if (unionid) {
                def member = Member.findByUnionId(unionid)
                if (member) {
                    data.memberAddress = member.address
                    data.memberUserName = member.userName
                    data.memberMobile = member.mobile
                }
            }

            params.totalprice =0.00

            goodscodeList.eachWithIndex{it,index->
                def good = Goods.findByGoodsCode(it),
                    count = params.goodscount.split(",")[index],
                    orderItem = [goodsCode:good.goodsCode,orderCount:params.goodscount.split(",")[index],goodsPrice:
                            good.salePrice,goodsName:good.goodName] as StartOrderItemDto
                data.startOrderItemDtoList.add(orderItem)
                params.totalprice = params.totalprice.add(good.salePrice.multiply(count.toInteger()))
            }
            data.totalPrice = params.totalprice
            result.setData(data)
        }
        catch (Exception e) {
            result.result = CommonResult.CommonResultStatus.FAIL
            log.error("startorder error",e)
        }
        render result as JSON

    }


    def createorder() {
        CommonResult<Boolean> result = new CommonResult<Boolean>()
        try {
            def unionid = CommonUtils.getCookieValue(request,"unionid"),
                orderItemList = [];

            if (!unionid && grailsApplication.config.current.environment.name == 'dev') {
                unionid = '123456789'
            }
            def member
            if (params.orderMobile) {
                member = Member.findByMobile(params.orderMobile)
            }

            if(!member) {
                member = Member.findByUnionId(unionid)
            }

            if (!member) {
                member = new Member(unionId: unionid, memberSource: Member.MemberSource.WECHAT,
                        mobile:params.orderMobile,address:params.orderAddress,userName:params.orderContract).save(flush: true)
            }
            else {
                if (!member.unionId) {
                    member.unionId = unionid
                }
                if (!member.mobile) {
                    member.mobile = params.orderMobile
                }
                if (!member.address) {
                    member.address = params.orderAddress
                }
                if (!member.userName) {
                    member.userName = params.orderContract
                }

                member.save(flush: true)
            }

            def order = new Orders(code: CommonUtils.generateSixCode(), address: params.orderAddress,
                    phone: params.orderMobile, contactName: params.orderContract, orderSource: Orders.OrderSource.WECHAT_DECUTATION_2,
                    orderStatus: Orders.OrderStatus.PLACE, remark: params.orderRemark,member: member)
            order.sendDate = new Date(((new Date()).format("yyyy/MM/dd")) + " " + params.orderSendTime)
            params.goodsCodes.split(",").eachWithIndex { it, index ->
                def goods = Goods.findByGoodsCode(it)
                def countList = params.goodsCount.split(",")
                def orderItem = new OrderItem(count: countList[index], totalPrice:
                        goods.getSalePrice().multiply(countList[index].toInteger()),goods: goods)
                orderItemList.add(orderItem)
            }
            params.order = order
            params.totalPrice = 0
            orderItemList.each { it ->
                it.orderName = params.order.code
                params.order.addToOrderItem(it)
                params.totalPrice = it.totalPrice+(params.totalPrice)
            }
            order.totalPrice=params.totalPrice
            order.save(flush: true)
            result.data=true
        } catch (Exception e) {
            result.result = CommonResult.CommonResultStatus.FAIL
            log.error("createorder error",e)
        }

        render result as JSON
    }




}
