class ArchiveController {

    def index = { }

    def list = {
        def c = Entry.createCriteria()
        def entries = c {
            isNotNull('enclosureURL')
            lt("created", new Date())
            order("created", "desc")

        }
        [entries:entries]
    }
}
