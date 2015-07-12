package com.jujiao.business

import org.apache.commons.logging.LogFactory
import static groovyx.net.http.ContentType.JSON

class WechatController {

    private static final log = LogFactory.getLog(this)

    def wechatService
    def cookieService

    def index() {
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
            "name": "我要订餐",
            "url": "http://sales.dodopotato.com/web/index"
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
            def accessToken,openId
            withHttp(uri: "https://api.weixin.qq.com",contentType: JSON){
                def response = get(path:'/sns/oauth2/access_token',query:[appid:grailsApplication.config.wechat.config.appid,
                                                           secret:grailsApplication.config.wechat.config.secret,
                                                        code:params.code,grant_type:'authorization_code']){resp,html->
                    return html
                }
                accessToken = response.access_token
                openId = response.openid
                log.error('accessToken==='+accessToken+'--openid'+openId)

                response = get(path:'/sns/userinfo',query:[access_token: accessToken,
                                                                          openid:openId,
                                                                          lang:'zh_CN']){resp,html->
                    return html
                }

                log.error('wechat auth unionid---'+response.unionid)
                cookieService.setCookie("unionid",response.unionid)

                if (!Member.findByUnionId(response.unionid)) {
                    def member = new Member(unionId:response.unionid,memberSource: Member.MemberSource.CALL_CENTER)
                    member.save(flush:true)
                }


                redirect(controller: "homepage",controllerNamespace:'wechat',action: "index")
            }
        }
        else {
            log.error('error get params code')
        }
    }
}
