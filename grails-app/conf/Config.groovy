import java.awt.Font
import java.awt.Color

import com.octo.captcha.service.multitype.GenericManageableCaptchaService 
import com.octo.captcha.engine.GenericCaptchaEngine 
import com.octo.captcha.image.gimpy.GimpyFactory 
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator 
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage 
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator 
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator 
import com.octo.captcha.component.image.color.SingleColorGenerator 
import com.octo.captcha.component.image.textpaster.NonLinearTextPaster

//test
testconfig="Hi I am config!"


//disable signup
authentication.signup.disabled = true


// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text-plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://gspot.morphexchange.com"
    }
}

// log4j configuration
log4j {
    appender.stdout = "org.apache.log4j.ConsoleAppender"
    appender.'stdout.layout'="org.apache.log4j.PatternLayout"
    appender.'stdout.layout.ConversionPattern'='[%r] %c{2} %m%n'
    rootLogger="info,stdout"
    logger {
        grails="WARN"
		grails
		{
			app.controller="DEBUG"
		}
        org {
            codehaus.groovy.grails.web.servlet="error"  //  controllers
            codehaus.groovy.grails.web.pages="error" //  GSP
            codehaus.groovy.grails.web.sitemesh="error" //  layouts
            codehaus.groovy.grails."web.mapping.filter"="error" // URL mapping
            codehaus.groovy.grails."web.mapping"="error" // URL mapping
            codehaus.groovy.grails.commons="info" // core / classloading
            codehaus.groovy.grails.plugins="error" // plugins
            codehaus.groovy.grails.orm.hibernate="error" // hibernate integration
            springframework="off"
            hibernate="off"
        }
    }
}


jcaptchas { 
	imageCaptcha = new GenericManageableCaptchaService( 
			new GenericCaptchaEngine( 
						new GimpyFactory( 
								new RandomWordGenerator( 
										"1234567890grails"
								), 
								new ComposedWordToImage( 
										new RandomFontGenerator( 20, // min font size 
																 30, // max font size 
																[new Font("Arial", 0, 10)] as Font[] 
										), 
										new GradientBackgroundGenerator( 140, // width 
																		 35, // height 
																		 new SingleColorGenerator(new Color(0, 60, 0)), 
																		 new SingleColorGenerator(new Color(20, 20, 20)) 
										), 
										new NonLinearTextPaster( 6, // minimal length of text 
																 6, // maximal length of text 
																 new Color(0, 255, 0) 
										)
									) 
							) 
				), 
				600, // minGuarantedStorageDelayInSeconds 
				180000 // maxCaptchaStoreSize 
		)
}


