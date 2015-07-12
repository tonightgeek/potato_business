package com.jujiao.business.wechat.Homepage

class StartOrderDto {


    Float totalPrice
    String memberUserName
    String memberAddress
    String memberMobile
    def startOrderItemDtoList = [].withLazyDefault {new StartOrderItemDto()}


}


