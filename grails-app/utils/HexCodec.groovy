class HexCodec {
	static HEXDIGITS = '0123456789ABCDEF'
	
	// Expects an array/list of numbers
    static encode = { theTarget ->
		if (theTarget == null) {
			return null
		} else {
			def result = new StringBuffer()
			theTarget.each() { 
				result << HexCodec.HEXDIGITS[(it & 0xF0) >> 4]
				result << HexCodec.HEXDIGITS[it & 0x0F]
			}
			return result.toString()
		}
	}

	static decode = { theTarget ->
		throw new UnsupportedOperationException("Decode of hex strings not implemented yet")
	}
}