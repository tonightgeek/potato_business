package com.jujiao.business

import org.apache.commons.logging.LogFactory

class WechatController {

    private static final log = LogFactory.getLog(this)

    def wechatService
    def cookieService

    def index() {
        log.error("enter index2")
        for(String param : request.getParameterNames()){
            log.error("parameters--"+param+":"+request.getParameter(param))
        }
        if(request.getParameter("echostr")){
            log.error("parameters--"+request.getParameter("echostr"))
            response.getWriter()
//            response.writer.write(request.getParameter("echostr"))
            render(request.getParameter("echostr"),contentType: "text/plain",encoding: "utf-8")
        }
    }

    def refreshAccessToken() {
        wechatService.refreshAccessToken()
    }

    def generateMenu() {
        def menus = """{
    "button": [
        {
            "type": "view",
            "name": "我要订餐1",
            "url": "http://sales.dodopotato.com/potato_business/web/index"
        }
    ]
}"""
        withHttp(uri:"https://api.weixin.qq.com"){
            def jsonObject = post(path:'/cgi-bin/menu/create',query:[access_token:wechatService.refreshAccessToken()],
                body:menus)
            if (jsonObject.errcode.toInteger() == 0) {

            }
        }
        render "ok"
    }

    def authRedirectUrl() {
        if (params.code) {
            log.error('get paramscode' + params.code)
            withHttp(uri: "https://api.weixin.qq.com"){
                log.error('start get union id')
                def response = get(path:'/sns/oauth2/access_token',query:[appid:grailsApplication.config.wechat.config.appid,
                                                           secret:grailsApplication.config.wechat.config.secret,
                                                        code:params.code,grant_type:'authorization_code'])
                cookieService.setCookie("unionid",response.unionid)
                cookieService.setCookie("openid",response.openid)
                log.error('unionid==='+response.unionid+'openid'+response.openid)
                redirect(controller: "main",controllerNamespace:'wechat',action: "index")
            }
        }
        else {
            log.error('error get params code')
        }
    }
}
