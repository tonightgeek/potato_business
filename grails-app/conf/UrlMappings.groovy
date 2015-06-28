import com.jujiao.business.WechatController

class UrlMappings {

	static mappings = {

        "/" (
                controller: 'wechat',
                action: 'index'
        )

        "/admin/index" (
            namespace:'admin',
            controller:'index',
            action:'index'
        )

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
	}
}
