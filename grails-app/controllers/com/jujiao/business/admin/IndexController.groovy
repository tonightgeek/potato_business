package com.jujiao.business.admin

class IndexController {

    static namespace = "admin"

    def index() {
        redirect(controller: OrderController,action: "index")
    }


}
