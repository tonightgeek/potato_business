package com.jujiao.business

import org.apache.commons.logging.LogFactory


class WechatController {

    private static final log = LogFactory.getLog(this)

    def index() {
        log.error("enter index")
        for(String param : request.getParameterNames()){
            log.error("parameters--"+param+":"+request.getParameter(param))
        }
        if(request.getParameter("echstr")){
            log.error("parameters--"+request.getParameter("echstr"))
            return request.getParameter("echstr")
        }
    }
}
