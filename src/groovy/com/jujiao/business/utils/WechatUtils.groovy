package com.jujiao.business.utils

import grails.converters.JSON
import grails.plugin.cache.CachePut
import grails.plugin.cache.Cacheable
import org.springframework.beans.factory.annotation.Value

class WechatUtils {

    @Value('${wechat.config.appid}')
    String appId

    @Value('${wechat.config.secret}')
    String appSecret

    @CachePut(value='web',key='wechatAccssToken')
    public static String refreshAccessToken() {
        withHttp(uri:'https://api.weixin.qq.com'){
            def jsonObject = get(path:'/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET',query:[
                    grant_type:'client_credential',
                    appid:appId,
                    secret:appSecret
            ]) as JSON
            return jsonObject.access_token
        }
    }

    @Cacheable(value='web',key='wechatAccssToken')
    public static String getAccessToken(){
        WechatUtils.refreshAccessToken()
    }
}
