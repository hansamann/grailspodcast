class MobileController {

    def index = { redirect(action:'list', params:params) }

    def list =
    {
        log.info('mobile list Action')

        def c = Entry.createCriteria()
        def entries = c {
            isNotNull('enclosureURL')
            lt("created", new Date())
            maxResults(5)
            order("created", "desc")
            
        }
        [entries:entries, offset:0]
    }

    def more =
    {
        log.info('more action')
        def c = Entry.createCriteria()
        def entries = c {
            isNotNull('enclosureURL')
            lt("created", new Date())
            maxResults(5)
            firstResult(params.offset.toInteger())
            order("created", "desc")

        }
        def model = [entries: entries, offset:params.offset.toInteger()]
        render(template:'more', model:model)
        
    }

    def show =
    {
        log.info('show action')
        [entry: Entry.get(params.id)]
    }
}
