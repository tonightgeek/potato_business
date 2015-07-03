package com.jujiao.business.web

import org.apache.commons.logging.LogFactory


class WechatRefreshJob {

    def wechatService
    private static final log = LogFactory.getLog(this)

    static triggers = {
      simple startDelay: 60000l, repeatInterval: 7200000l // execute job once in 5 seconds
    }

    def execute() {
        try {
            if (!wechatService.getAccessToken()) {
                def accessToken = wechatService.refreshAccessToken()
                log.error("Refresh access token success" + accessToken)
            }
            else {
                log.error("Get WechatRefreshJob success" + wechatService.getAccessToken())
            }
        } catch (Exception e) {
            log.error("WechatRefreshJob error",e)
        }

    }
}
