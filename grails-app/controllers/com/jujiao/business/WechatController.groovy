package com.jujiao.business

import org.apache.commons.logging.LogFactory


class WechatController {

    private static final log = LogFactory.getLog(this)

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
}
