package potato_business

import org.apache.commons.logging.LogFactory

import java.text.MessageFormat

class AuthFilters {

    def cookieService
    private static final log = LogFactory.getLog(this)

    def filters = {

//        someUri(uri:'/web/**'){
//            before = {
//                log.error('start web interceptor')
//                if(!cookieService.getCookie("unionid")) {
//                    def redirectUrl = MessageFormat.format(grailsApplication.config.weixin.oauth2.url, [grailsApplication.config.wechat.config.appid,
//                                                                                                        URLEncoder.encode(grailsApplication.config.weixin.oauth2.redirectUri)].toArray())
//                    redirect(url: redirectUrl)
//                    return false
//                }
//                else {
//                    return true
//                }
//            }
//        }
    }
}
