class UrlMappings {

	static mappings = {
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

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
