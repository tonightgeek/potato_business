package potato_business

import com.jujiao.business.common.CommonUtils
import org.apache.commons.logging.LogFactory

import javax.servlet.http.Cookie
import java.text.MessageFormat

class AuthFilters {

    private static final log = LogFactory.getLog(this)

    def filters = {

        someUri(uri:'/web/**'){
            before = {
                try {
                    if (grailsApplication.config.current.environment.name == 'prod') {

                        String unionid = CommonUtils.getCookieValue(request,"unionid")

                        if (!unionid) {

                            log.error("actionname" + actionName + "error get unionid")
                            def redirectUrl = MessageFormat.format(grailsApplication.config.weixin.oauth2.url, [grailsApplication.config.wechat.config.appid,
                                                                                                                URLEncoder.encode(grailsApplication.config.weixin.oauth2.redirectUri)].toArray())
                            redirect(url: redirectUrl)
                            return false
                        } else {
                            log.error("actionname----" + actionName + " unionid----" + unionid)
                            return true
                        }
                    }
                    else {



                        if (!CommonUtils.getCookieValue(request,"unionid")) {
                            CommonUtils.addCookie(response,"unionid","123456789")
                        }
                        else {
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
