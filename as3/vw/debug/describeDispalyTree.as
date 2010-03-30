package vw.debug {
	import flash.display.DisplayObject;
	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public function describeDispalyTree(target:DisplayObject):String {
		var searchDepth:int = 30;
		var pointer:DisplayObject = target.parent;
		var result:String = "";
		for (var i:int = 0;i < searchDepth;i++) {
			if(!pointer)break;
			result = "[" + pointer.toString() + "," + pointer .name + "]." + result;
			pointer = pointer.parent;
		}
		
		result = "describeDispalyTree : " + target.name + "\n" + result + "[" + target.toString() + "," + target .name + "]" + "\n-------------------";
		
		return result;
	}
}
