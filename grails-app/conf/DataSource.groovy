dataSource {
	pooled = false
	driverClassName = "org.postgresql.Driver"
	dialect = "org.hibernate.dialect.PostgreSQLDialect" 
	username = "postgres"
	password = "postgres"
}
hibernate {
    cache.use_second_level_cache=false
    cache.use_query_cache=false
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create" // one of 'create', 'create-drop','update' create kills data!
			url = "jdbc:postgresql://localhost:5432/gspot"
		}
	}
	test {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
				url = "jdbc:hsqldb:mem:devDB"
		}
	}
	production {
		dataSource {
			//dbCreate = "create" // one of 'create', 'create-drop','update'
			username = "user_581"
			password = "p_ezuyew"
			url = "jdbc:postgresql://10.254.239.98/db_1_581"
		}
	}
}