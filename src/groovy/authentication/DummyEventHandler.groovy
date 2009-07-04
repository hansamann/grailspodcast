package authentication

class DummyEventHandler {
    def onValidateLogin( loginID ) {  }
    def onValidatePassword( password ) { }
    def onEncodePassword( password ) {  }
    def onFindByLogin( loginID ) {  }
    def onNewUserObject( loginID ) {  }
    def onSaveUser( user ) {  }
    def onLoggedIn( AuthenticatedUser login ) { }
    def onLoggedOut( AuthenticatedUser login ) { }
    def onSignup( params) { }
    def onDelete( user ) { user.delete() }
    def onPasswordReset( login ) { }
    def onConfirmAccount( user ) { }    
    def onCheckAuthorized( params ) { }    
    def onUnauthorizedAccess( params ) { }    
}