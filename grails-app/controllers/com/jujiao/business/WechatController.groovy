package com.jujiao.business

import com.jujiao.business.common.CommonUtils
import org.apache.commons.logging.LogFactory

import javax.servlet.http.Cookie

import static groovyx.net.http.ContentType.JSON

class WechatController {

    private static final log = LogFactory.getLog(this)

    def wechatService

    def index() {
        log.error("request.reader.text -- "+request.reader.text)
        render "ok"
//        log.error("wechat index---"+request.getContentLength())
//        for(String param : request.getParameterNames()){
//            log.error("parameters--"+param+":"+request.getParameter(param))
//        }
//        if(request.getParameter("echostr")){
//            response.getWriter()
//            render(request.getParameter("echostr"),contentType: "text/plain",encoding: "utf-8")
//        }
    }

    def refreshAccessToken() {
        wechatService.refreshAccessToken()
    }

    def generateMenu() {
        def result;
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
            log.error("generatemenu--"+jsonObject)
            if (jsonObject.errcode.toInteger() == 0) {

                result == 'ok'
            }
            else {
                result = jsonObject.errcode
            }
        }
        render result
    }

    def authRedirectUrl() {
        def servletResponse = response
        if (params.code) {
            def accessToken, openId
            withHttp(uri: "https://api.weixin.qq.com", contentType: JSON) {
                def response = get(path: '/sns/oauth2/access_token', query: [appid : grailsApplication.config.wechat.config.appid,
                                                                             secret: grailsApplication.config.wechat.config.secret,
                                                                             code  : params.code, grant_type: 'authorization_code']) { resp, html ->
                    return html
                }
                accessToken = response.access_token
                openId = response.openid

                response = get(path: '/sns/userinfo', query: [access_token: accessToken,
                                                              openid      : openId,
                                                              lang        : 'zh_CN']) { resp, html ->
                    return html
                }

                CommonUtils.addCookie(servletResponse,"unionid", response.unionid,"/",60 * 60 * 24)
                log.error('unionid from cookie '+CommonUtils.getCookieValue(request,"unionid"))

                if (!Member.findByUnionId(response.unionid)) {
                    def member = new Member(unionId: response.unionid, memberSource: Member.MemberSource.WECHAT)
                    member.save(flush: true)
                }


                redirect(controller: 'web', action: 'index')
            }
        } else {
            log.error('error get params code')
        }
    }
}
