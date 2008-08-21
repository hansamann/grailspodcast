<html>
<head>
	<meta name="layout" content="main" />
</head>
<body>
	<div class="body">
	<h1>Authentication</h1>
	<auth:ifLoggedIn>
		You are currently logged in as: <auth:user/>
		<h2>Log out</h2>
		<auth:form authAction="logout" success="[controller:'authentication', action:'index']" error="[controller:'authentication', action:'index']">
		    <g:actionSubmit value="Log out"/> 
		</auth:form>
	</auth:ifLoggedIn>
	<auth:ifUnconfirmed>
		You've registered but we're still waiting to confirm your account. <g:link action="reconfirm">Click here to send a new confirmation request</g:link> if you missed it the first time.
	</auth:ifUnconfirmed>
	<auth:ifNotLoggedIn>
	<g:if test="${flash.authenticationFailure}">
		Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/><br/>
	</g:if>
	

	<auth:form authAction="login" success="[controller:'authentication', action:'index']" error="[controller:'authentication', action:'index']">
	<table>
		   <tr>
		   <td>User ID:</td>
		   <td> <g:textField name="login" value="${flash.loginForm?.login?.encodeAsHTML()}"/>
		    <g:hasErrors bean="${flash.loginFormErrors}" field="login"><g:renderErrors bean="${flash.loginFormErrors}" as="list" field="login"/></g:hasErrors></td>
		   </tr>
			<tr>
		    <td>Password:</td>
		    <td><input name="password" value="" type="password"/><br/>
			<g:hasErrors bean="${flash.loginFormErrors}" field="password"><g:renderErrors bean="${flash.loginFormErrors}" as="list" field="password"/></g:hasErrors></td>
			</tr>
	</table>    
	<g:actionSubmit value="Log in"/> 
	</auth:form>
	
	</auth:ifNotLoggedIn>
	<div>
</body>
</html>