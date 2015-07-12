package potato_business

import org.apache.commons.logging.LogFactory

import java.text.MessageFormat

class AuthFilters {

    def cookieService
    private static final log = LogFactory.getLog(this)

    def filters = {

        someUri(uri:'/homepage/**'){
            before = {
                try {
                    if (grailsApplication.config.current.environment.name == 'prod') {
                        log.error('start web interceptor')
                        if (!cookieService.getCookie("unionid")) {
                            log.error("error get unionid")
                            def redirectUrl = MessageFormat.format(grailsApplication.config.weixin.oauth2.url, [grailsApplication.config.wechat.config.appid,
                                                                                                                URLEncoder.encode(grailsApplication.config.weixin.oauth2.redirectUri)].toArray())
                            redirect(url: redirectUrl)
                            return false
                        } else {
                            log.error("unionid----" + cookieService.getCookie("unionid"))
                            return true
                        }
                    }
                    else {
                        if (!cookieService.getCookie("unionid")) {
                            cookieService.setCookie("unionid","123456789")
                        }
                        else {
                            log.error("dev unionid----" + cookieService.getCookie("unionid"))
                            return true
                        }
                    }
                }
                catch (Exception e) {
                    log.error('error on filters',e)
                    return false
                }
            }
        }
    }
}
