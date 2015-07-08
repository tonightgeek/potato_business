package com.jujiao.business.admin.command

class OrderCommand {

    String memberId
    String memberFirstName
    String memberLastName
    String memberMobile
    String memberAddress

    String orderCode
    String orderPhone
    String orderContact
    String orderAddress
    String time
    String remark

    List<OrderItemCommand> orderItemCommandList = new ArrayList<OrderItemCommand>()

}
