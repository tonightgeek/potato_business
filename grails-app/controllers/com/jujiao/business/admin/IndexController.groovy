package com.jujiao.business.admin

class IndexController {

    static namespace = "admin"

    def index() {
        render(view:"/admin/index")
    }
}
