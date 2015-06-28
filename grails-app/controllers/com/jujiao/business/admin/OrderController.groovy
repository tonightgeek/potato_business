package com.jujiao.business.admin

class OrderController {

    static namespace = "admin"

    def index() {
        render(view: "/admin/order/index")
    }
}
