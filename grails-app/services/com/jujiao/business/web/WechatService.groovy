package com.jujiao.business.web

import grails.converters.JSON
import grails.plugin.cache.CachePut
import grails.plugin.cache.Cacheable
import grails.transaction.Transactional
import groovy.json.JsonSlurper
import org.springframework.beans.factory.annotation.Value

@Transactional
class WechatService {

    @Value('${wechat.config.appid}')
    String appId

    @Value('${wechat.config.secret}')
    String appSecret

    @CachePut(value='web')
    public String refreshAccessToken(String accessToken='') {
        withHttp(uri:'https://api.weixin.qq.com'){
            def jsonObject = get(path:'/cgi-bin/token',query:[
                    grant_type:'client_credential',
                    appid:appId,
                    secret:appSecret
            ])
            return jsonObject.access_token
        }
    }

    @Cacheable(value='web')
    public String getAccessToken(String accessToken=''){
        this.refreshAccessToken(accessToken)
    }



}
