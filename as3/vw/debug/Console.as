package vw.debug {

	import flash.text.TextField;
	import flash.external.ExternalInterface;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Console {

		private static var _active:Boolean = true;
		private static var _text:TextField = new TextField();
		private static var count:int = 0;
		{
			_text.multiline = true;
			_text.wordWrap = true;
		}

		public static function call(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
			// trace("call(", JSON.encode(mes), ")");
		}

		public static function addCallback(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
			// trace("addCallBack(", JSON.encode(mes), ")");
		}

		public static function log(...mes):void {
			if (!_active) return;
			ExternalInterface.call("console.log", mes);
			// trace("addCallBack(", JSON.encode(mes), ")");
		}

		public static function trace(...mes):void {
			if (!_active) return;
			text.appendText(String(count++)+" ,"+mes.join("")+"\n");
			text.scrollV =text.maxScrollV;
		}

		static public function get active():Boolean {
			return _active;
		}

		static public function set active(value:Boolean):void {
			_active = value;
		}

		static public function get text():TextField {
			return _text;
		}
	}
}
