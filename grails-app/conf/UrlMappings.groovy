class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?"()
        "/episode/$id"(controller:"blog", action:"episodeNumber")
        "/"{
            controller = {
                def serverName = request.serverName
                println serverName

                serverName.startsWith('m.') ? 'mobile' : false
            }
            action = 'list'
        }
        "500"(view:'/error')
    }
}
