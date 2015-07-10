package com.jujiao.business.admin.command

class OrderCommand {

    String orderCode
    String orderPhone
    String orderContact
    String orderAddress
    String time
    String remark

    String unionId
    boolean shouldChangeMemberAddress
    boolean shouldChangeMemberName

    List<OrderItemCommand> orderItemCommandList = [].withLazyDefault{
        return new OrderItemCommand()
    }

}
