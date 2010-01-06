class RecaptchaService {

    boolean transactional = true

    def validate(remoteIP, challenge, captcha) {
        def privateKey = "6LeuWgYAAAAAAICW79L4vUmfZ66Ig8q_b_imbkJ3"
        captcha = URLEncoder.encode(captcha, "UTF-8")

        def con = new URL('http://api-verify.recaptcha.net/verify').openConnection()
        con.doOutput = true
        con.outputStream.withWriter { w ->
            def data = "privatekey=${privateKey}&remoteip=${remoteIP}&challenge=${challenge}&response=${captcha}"
            w.print(data)
        }

        def responseLines = con.inputStream.readLines()

        return responseLines.join(',')

 
        /*if (responseLines[0].trim() == 'true')
            return true
        else
            return false*/  
    }
}
