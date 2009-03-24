class CommentController extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ commentList: Comment.list( params ) ]
    }

    def show = {
        def comment = Comment.get( params.id )

        if(!comment) {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ comment : comment ] }
    }

    def delete = {
        def comment = Comment.get( params.id )
        if(comment) {
            comment.delete()
            flash.message = "Comment ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def comment = Comment.get( params.id )

        if(!comment) {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ comment : comment ]
        }
    }

    def update = {
        def comment = Comment.get( params.id )
        if(comment) {
            comment.properties = params
            if(!comment.hasErrors() && comment.save()) {
                flash.message = "Comment ${params.id} updated"
                redirect(action:show,id:comment.id)
            }
            else {
                render(view:'edit',model:[comment:comment])
            }
        }
        else {
            flash.message = "Comment not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def comment = new Comment()
        comment.properties = params
        return ['comment':comment]
    }

    def save = {
        def comment = new Comment(params)
        def entry = Entry.get(params.entry.id)
        entry.addToComments(comment)
        
        if(!comment.hasErrors() && comment.save()) {
            flash.message = "Comment ${comment.id} created"
            redirect(action:show,id:comment.id)
        }
        else {
            render(view:'create',model:[comment:comment])
        }
    }
}
