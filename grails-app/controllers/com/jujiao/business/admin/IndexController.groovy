package com.jujiao.business.admin

class IndexController {

    static namespace = "admin"

    def index() {
        redirect(uri: "/admin/order")
    }


}
