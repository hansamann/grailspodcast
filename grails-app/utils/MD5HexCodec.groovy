import java.security.MessageDigest

class MD5HexCodec {
    static encode = { theTarget ->
		if (theTarget == null) {
			return null
		} else {
			def md = theTarget.encodeAsMD5()
			return md.encodeAsHex()
		}
	}

	static decode = { theTarget ->
		throw new UnsupportedOperationException("Cannot decode MD5 hashes")
	}
}