package com.jujiao.business

import com.jujiao.business.utils.CommonUtils
import org.apache.commons.logging.LogFactory

import static groovyx.net.http.ContentType.JSON

class WechatController {

    private static final log = LogFactory.getLog(this)

    def wechatService

    def index() {

        if (request.XML?.MsgType == "text") {
            log.error("request.XML.MsgType")
            def result = String.format("""<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime>
            <MsgType><![CDATA[text]]></MsgType><Content><![CDATA[%s]]></Content></xml>""",request.XML?.FromUserName,request.XML?.ToUserName,Calendar.getInstance().getTime().getTime(),
            """你好,欢迎关注"土豆嘟嘟".我们的营业时间是10:00-21:00,配送范围在五角场和江湾体育场,为了不影响您的用餐时间,请提前1小时订餐,谢谢!""")
            log.error(result)
            render(result,contentType: "text/plain",encoding: "utf-8")
        }
        else if (request.XML?.MsgType == "event" && request.XML.Event=="subscribe") {
            log.error("request subscribe event")
            def result = String.format("""<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime>
            <MsgType><![CDATA[text]]></MsgType><Content><![CDATA[%s]]></Content></xml>""",request.XML?.FromUserName,request.XML?.ToUserName,Calendar.getInstance().getTime().getTime(),
                    """你好,欢迎关注"土豆嘟嘟".我们的营业时间是10:00-21:00,配送范围在五角场和江湾体育场,为了不影响您的用餐时间,请提前1小时订餐,谢谢!""")
            log.error(result)
            render(result,contentType: "text/plain",encoding: "utf-8")
        }
        else if (request.XML?.MsgType == "event" && request.XML.Event == "unsubscribe") {
            log.error("request unsubscribe event")
        }



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
