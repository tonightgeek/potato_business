package com.jujiao.business.wechat

import org.apache.commons.logging.LogFactory

import java.text.MessageFormat

class MainController {

    static namespace = "wechat"
    private static final log = LogFactory.getLog(this)


    def index() {
        render(view:"/wechat/index")
    }


}
