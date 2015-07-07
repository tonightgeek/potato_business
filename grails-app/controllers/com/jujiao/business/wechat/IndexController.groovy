package com.jujiao.business.wechat

import java.text.MessageFormat

class IndexController {

    static namespace = "wechat"
    def cookieService

    static beforeInterceptor = {
        if(!cookieService.getCookie("openid")) {
            def redirectUrl = MessageFormat.format(grailsApplication.config.weixin.oauth2.url, [grailsApplication.config.wechat.config.appid,
                                                                                                URLEncoder.encode(grailsApplication.config.weixin.oauth2.redirectUri)].toArray())
            redirect(url: redirectUrl)
            return false
        }
    }

    def index() {
        redirect(uri: "/wechat/index")

    }


}
