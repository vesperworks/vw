package vw.debug {
	import flash.external.ExternalInterface;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Console {

		private static var _active:Boolean = true;

		public static function call(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
//			trace("call(", JSON.encode(mes), ")");
		}

		public static function addCallback(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
//			trace("addCallBack(", JSON.encode(mes), ")");
		}

		public static function log(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
//			trace("addCallBack(", JSON.encode(mes), ")");
		}
		
		static public function get active():Boolean { return _active; }
		
		static public function set active(value:Boolean):void 
		{
			_active = value;
		}
	}
}
