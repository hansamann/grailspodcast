import com.sun.syndication.feed.synd.SyndImageImpl
import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication

class BlogController
{
  def twitterService

  def index = { redirect(action: list, params: params) }

  def list = {
    log.info('list Action')

    params.max = 10
    //params.max = Math.min( params.max?.toInteger() ?: 0, 10)
    params.order = "desc"
    params.sort = "created"
    [entries: Entry.findAllByCreatedLessThan(new Date(), params)]
  }

  def newComment =
  {
    log.info('newComment Action')

    def comment = new Comment(params)
    def entry = Entry.get(params.entry.id)
    entry.addToComments(comment)
    log.info("errors? ${comment.hasErrors()}")
    log.info("entry id: ${comment.entry.id}")

    if (!comment.hasErrors() && comment.save())
    {

      if (GrailsUtil.environment != GrailsApplication.ENV_DEVELOPMENT)
      {
        try
        {
          twitterService.announceComment(entry)
        }
        catch (Exception e)
        {
          log.warn('Unable to send comment twitter message', e)
        }
      }
      else
      {
        log.info('Not sending twitter message in development')
      }

      render(contentType: "text/json") {
        ok(entryId: comment.entry.id)
      }
    }
    else
    {
      render(contentType: "text/json") {
        error(msg: 'Please specify all input fields.')
      }
    }


  }

  def id = {
    log.info('id action')
    def entry = Entry.get(params.id)
    render(view: "list", model: [entries: entry, title: entry?.title])
  }

  //called by episode URLMapping
  def episodeNumber =
  {
    log.info('episodeNumber: ' + params.id)
    def entry = Entry.findByTitleIlike("%Episode ${params.id}%")
    render(view: "list", model: [entries: entry, title: entry?.title])
  }

  def tag = {
    log.info('tag action')
    params.order = "desc"
    params.sort = "created"
    render(view: "list", model: [entries: Entry.findAllByTagsIlike("%${params.id}%", params)])
  }

  def rss = {
    def entries = Entry.findAllByCreatedLessThan(new Date(), [order: 'desc', sort: 'created']);
    def linkBase = 'http://www.grailspodcast.com/'
    def desc = "This podcast will keep you up to date about Groovy and the Grails Web Application Framework. Shows delivered right into your favourite podcatcher include news about Grails and Groovy, Interviews with key developers and much more. E-Mail grails.podcast@gmail.com for feedback and inclusion into the show."
    def imageURL = 'http://gspot.morphexchange.com/images/gspot/grails_podcast_logo.jpg'

    def podcastImage = new SyndImageImpl()
    podcastImage.url = imageURL
    podcastImage.title = "Grails Podcast"
    podcastImage.link = "http://www.grailspodcast.com"

    render(feedType: "rss", feedVersion: "2.0")
            {
              title = "grailspodcast.com - The Groovy & Grails Podcast"
              link = "http://www.grailspodcast.com"
              description = desc
              language = "en-gb"
              copyright = "Glen Smith, Sven Haiges"
              image = podcastImage
              iTunes
              {
                summary = desc
                keywords = ['groovy', 'grails', 'java']
                categories = ["Technology"]
                image = new URL("http://docs.codehaus.org/download/attachments/62313/grails_podcast_logo.jpg") // later
                author = "Glen Smith, Sven Haiges"
                subtitle = "Stay up to date with Groovy and Grails"
                explicit = false
                ownerName = "Glen Smith, Sven Haiges"
                ownerEmailAddress = "grails.podcast@gmail.com"
              }

              entries.each {blogEntry ->
                def clean = cleanUp(blogEntry.content)
                entry(blogEntry.title)
                        {
                          link = "${linkBase}blog/id/${blogEntry.id}"
                          publishedDate = blogEntry.created
                          author = "Glen Smith, Sven Haiges"

                          content()
                                  {
                                    type = "text/html"
                                    blogEntry.content //returns the content
                                  }
                          if (blogEntry.enclosureURL)
                          {
                            enclosure
                            {
                              type = blogEntry.enclosureType
                              length = blogEntry.enclosureLength
                              url = blogEntry.enclosureURL
                            }
                          }
                          iTunes {
                            author = "Glen Smith, Sven Haiges"
                            keywords = ['groovy', 'grails', 'java']
                            explicit = false
                            subtitle = clean.subtitle
                            summary = clean.summary

                          }

                        }

              }
            }

  }

  private cleanUp(String markup)
  {
    def max = 500
    def nohtml = markup.replaceAll(/\<.*?\>/, '')

    if (nohtml.size() > max)
    {
      nohtml = nohtml[0..max] + '...'
    }

    def summary = nohtml;
    def subtitle = (nohtml.size() > 100) ? nohtml[0..100] + '...' : nohtml

    return [subtitle: subtitle, summary: summary]
  }


}
