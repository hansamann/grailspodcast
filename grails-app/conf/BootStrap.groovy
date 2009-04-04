import grails.util.GrailsUtil

class BootStrap {

     def init = { servletContext ->

        if (GrailsUtil.environment == 'development')
        {

            def entries = []
            entries << [1, 6014431, 2006, 8, 6]
            entries << [2, 12916191, 2006, 8, 11]
            entries << [3, 12001489, 2006, 8, 18]
            entries << [4, 15770325, 2006, 8, 20]
            entries << [5, 7846158, 2006, 8, 25]
            entries << [6, 11233092, 2006, 9, 1]
            entries << [7, 17905804, 2006, 9, 15]
            entries << [8, 22656384, 2006, 9, 22]
            entries << [9, 10340863, 2006, 9, 29]
            entries << [10, 12821126, 2006, 10, 6]
            entries << [11, 13711071, 2006, 10, 13]
            entries << [12, 11757060, 2006, 10, 20]
            entries << [13, 7765152, 2006, 10, 27]
            entries << [14, 25902801, 2006, 11, 3] ///TODO
            entries << [15, 3109964, 2006, 11, 10]
            entries << [16, 39317668, 2006, 11, 10]
            entries << [17, 27108447, 2006, 11, 17]
            entries << [18, 12802340, 2006, 11, 24]
            entries << [19, 12212013, 2006, 12, 1]
            entries << [20, 11370889, 2006, 12, 8]
            entries << [21, 8423591, 2006, 12, 15]
            entries << [22, 13215869, 2007, 1, 11]
            entries << [23, 25325559, 2007, 1, 19]
            entries << [24, 9532224, 2007, 1, 23]
            entries << [25, 38822040, 2007, 1, 31]
            entries << [26, 12302548, 2007, 2, 8]
            entries << [27, 35379909, 2007, 2, 15]
            entries << [28, 6451117, 2007, 2, 22]
            entries << [29, 14474033, 2007, 2, 28]
            entries << [30, 30546857, 2007, 3, 9]
            entries << [31, 30575275, 2007, 3, 18]
            entries << [32, 17304114, 2007, 3, 26]
            entries << [33, 10454243, 2007, 4, 5]
            entries << [34, 14487462, 2007, 4, 8]
            entries << [35, 12420327, 2007, 4, 15]
            entries << [36, 22470856, 2007, 4, 29]
            entries << [37, 11185031, 2007, 5, 12]
            entries << [38, 6185486, 2007, 5, 27]
            entries << [39, 9958665, 2007, 6, 17]
            entries << [40, 15524294, 2007, 6, 23]
            entries << [41, 17157819, 2007, 7, 15]
            entries << [42, 12751018, 2007, 8, 11]
            entries << [43, 10652762, 2007, 9, 17]
            entries << [44, 10117017, 2007, 9, 22]
            entries << [45, 5320137, 2007, 9, 26]
            entries << [46, 3230555, 2007, 10, 5]
            entries << [47, 4786901, 2007, 10, 10]
            entries << [48, 4801356, 2007, 10, 17]
            entries << [49, 23224324, 2008, 3, 2]
            entries << [50, 19147223, 2008, 3, 18]
            entries << [51, 27544281, 2008, 3, 30]
            entries << [52, 26655459, 2008, 4, 13]
            entries << [53, 29624266, 2008, 4, 27]
            entries << [54, 16799620, 2008, 5, 10]
            entries << [55, 30012999, 2008, 5, 11]
            entries << [56, 11304744, 2008, 5, 25]
            entries << [57, 21784251, 2008, 5, 27]
            entries << [58, 22953193, 2008, 6, 9]
            entries << [59, 34264031, 2008, 6, 22]
            entries << [60, 22562103, 2008, 7, 5]
            entries << [61, 35557969, 2008, 7, 20]
            entries << [62, 29943589, 2008, 8, 4]
            entries << [63, 27780657, 2008, 8, 17]
            entries << [64, 38744161, 2008, 8, 30]
            entries << [65, 27863846, 2008, 9, 10]
            entries << [66, 36082537, 2008, 9, 14]
            entries << [67, 47527132, 2008, 9, 27]
            entries << [68, 44237765, 2008, 10, 12]
            entries << [69, 38330773, 2008, 10, 18]
            entries << [70, 51692932, 2008, 11, 2]
            entries << [71, 43795497, 2008, 11, 15]
            entries << [72, 53202564, 2008, 11, 25]
            entries << [73, 42622382, 2008, 11, 29]

            entries << [74, 42034703, 2008, 12, 14]
            entries << [75, 47012073, 2008, 12, 21]
            entries << [76, 28062326, 2009, 01, 15]
            entries << [77, 63261282, 2009, 02, 01]
            entries << [78, 24582135, 2009, 02, 05]
            entries << [79, 39278234, 2009, 02, 14]

            def testContent1 = '''The soapbox topic is a quick comparison of <a href="http://code.google.com/p/iui/">iUI</a> and <a href="http://iwebkit.net/">iWebKit</a>, both toolkits&nbsp; for iPhone/iPod touch web development. <font size="2"><br>
<br>
</font><strong>Show Notes</strong><br>
<div><ul>

<li><a title="Grails GIT repository" href="http://github.com/grails/grails/tree/master" id="bvm7">Grails GIT repository</a> </li>
<li><a title="Grails &amp; AJAX File Uploads with Dojo" href="http://matt-stine.blogspot.com/2009/03/grailsdojo-ajax-file-upload.html" id="jgql">Grails &amp; AJAX File Uploads with Dojo</a> </li>
<li><a id="file" href="http://www.groovygrails.de/blog/groovygrails/entry/tomcat_and_java_versions_memory" title="Tomcat and Java versions on virtual hardware">Tomcat and Java versions on virtual hardware</a> </li>
<li><a id="zc0w" href="http://fbflex.wordpress.com/2009/03/22/grails-and-flex-some-interesting-recent-links/" title="Grails and Flex - some interesting recent links">Grails and Flex - some interesting recent links</a> </li>
<li><a id="d:5p" href="http://www.grailsblog.com/archive/show?id=10" title="Grails 1.1 IDE Smackdown">Grails 1.1 IDE Smackdown</a> </li>
<li><a id="gj_w" href="http://www.objectpartners.com/2009/03/25/intro-to-building-desktop-style-uis-javascript-on-grails/" title="Comparing ExtJS and GrailsUI for webapp dev">Comparing ExtJS and GrailsUI for webapp dev</a> </li>
<li>I<a id="a.i:" href="http://groovy.dzone.com/articles/implementing-load-demand-using" title="mplementing Load-on-demand with GrailsZK">mplementing Load-on-demand with GrailsZK</a></li>
<li><a title="GORM Labs Plugin 0.1" href="http://grails.org/plugin/gorm-labs" id="op11">GORM Labs Plugin 0.1</a> released</li>
<li>Peter Ledbrook's <a id="btpw" href="http://skillsmatter.com/podcast/java-jee/ggug-march" title="Gradle talk">Gradle talk</a> at London GGUG.</li>
<li><a id="ojdl" href="http://mrhaki.blogspot.com/2009/03/use-restclient-to-post-and-read-xml.html" title="Use RESTClient to post and read XML RESTful webservice">Use RESTClient to post and read XML RESTful webservice</a> </li>
<li><a title="GR8CONF" href="http://gr8conf.org" id="wf2w">GR8CONF</a> - early bird pricing till April 1st</li>
<li><a id="d46l" href="http://jameswilliams.be/blog/entry/139" title="Getting Started with Griffon screencast">Getting Started with Griffon screencast</a> by James Williams</li>
</ul>
We have a real highlight in terms of FREE stuff this episode. We give away a free pass for the <a href="http://gr8conf.org/">GR8CONF</a>. Listen to the show to get the details on how to win and visit their website to find out more. <br></div>
'''

             if (Entry.count() == 0)
             {
                entries.each
                { entry ->
                        def date = new GregorianCalendar(entry[2], entry[3]-1, entry[4]).getTime()
                        def e = new Entry(
                                        title:"Grails Podcast Episode ${entry[0]}",
                                        content:testContent1,
                                        created:date,
                                        tags:'groovy grails',
                                        enclosureURL:"http://hansamann.podspot.de/files/grails_podcast_episode_${entry[0]}.mp3",
                                        enclosureLength:entry[1]
                         ).save()
                }

                
             }


             if (AuthenticationUser.count() == 0)
             {
                 new AuthenticationUser(login:'hansamann', password:'5434DAD493D7B0F3281860E3EEA5EAC2', email:'hansamann@yahoo.de', status:1).save()
                 new AuthenticationUser(login:'glen.smith', password:'354083264AFF0A94E404F1F4E5DE5EFD', email:'glen.smith@gmail.com', status:1).save()
                 new AuthenticationUser(login:'grailspodcast', password:'', email:'grails.podcast@gmail.com', status:1).save()
             }
        }
     }
     def destroy = {
     }
     
     def getContent(number)
     {
    	 """This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah! This is content number ${number}, a very long blog entry. I cannot stop writing
this, I just cannot stop. Blubbbb ba blah!"""
    	 
     }
     
     def getCommentContent(number)
     {
    	 """This is comment number ${number}, a very long comment entry. I cannot stop writing
bullshit, I just cannot stop. Bla bla bla this is a comment and you will like it so much."""
    	 
     }     
} 