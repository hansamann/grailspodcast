import java.security.MessageDigest

class MD5Codec {
	// Returns the byte[] of the digest
    static encode = { theTarget ->
		if (theTarget == null) {
			return null
		} else {
			def md = MessageDigest.getInstance("MD5")
			md.update(theTarget.toString().getBytes()) // This probably needs to use the thread's Locale encoding
			return md.digest()
		}
	}

	static decode = { theTarget ->
		throw new UnsupportedOperationException("Cannot decode MD5 hashes")
	}
}