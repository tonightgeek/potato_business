class UrlMappings {

	static mappings = {

        "/" (
                controller: 'wechat',
                action: 'index'
        )

        "/admin/index" (
            namespace:'admin',
            controller:'homepage',
            action:'index'
        )

        group "/admin",{
            "/order"(controller: "order",namespace:"admin")
            "/order/$action"(controller: "order",namespace:"admin")
            "/goods/$action"(controller: "goods",namespace:"admin")
            "/member/$action"(controller: "member",namespace:"admin")
        }

        "/homepage/$action"(namespace:'wechat',controller: 'homepage')


        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
	}
}
