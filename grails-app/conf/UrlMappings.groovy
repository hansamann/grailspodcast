class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"()
      "/episode/$id"(controller:"blog", action:"episodeNumber")
	  "500"(view:'/error')
	}
}
