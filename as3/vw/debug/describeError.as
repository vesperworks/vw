package vw.debug {
	public function describeError($function:Function, ...args:Array) : *
	{
		var result:*;
		try {
			result = $function.apply(null, args);
		} catch (e:Error) {
			trace(e.getStackTrace());
			return result;
		}
		
		return result;
	}
}