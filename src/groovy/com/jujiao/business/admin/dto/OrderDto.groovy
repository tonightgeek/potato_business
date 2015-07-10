package com.jujiao.business.admin.dto

class OrderDto {

    String contactName
    String code
    String phone
    Float totalPrice
    String address
    String dateCreated
    String sendDate
    String orderStatus
    String remark
    def orderItemDtoList = [].withLazyDefault {return new OrderItemDto()}
}
