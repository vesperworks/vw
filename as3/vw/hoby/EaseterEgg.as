package vw.hoby {

	import flash.events.Event;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	/**	 * @author Takashi Murai (KAYAC)	 */
	 [Event(name="open", type="flash.events.Event")]
	public class EaseterEgg extends EventDispatcher{

		private static var __instance:EaseterEgg;
		private var _isOpen:Boolean;
		

		/**		 * @return singleton instance of EaseterEgg		 */
		public static function get instance() : EaseterEgg {
			if (__instance == null)
				__instance = new EaseterEgg;
			return __instance;
		}

		public function EaseterEgg() {
			_isOpen=false;
		}

		private static var count:uint = 0;
		private static var callback:Function;
		private static var oass:Array = [Keyboard.UP, Keyboard.UP, Keyboard.DOWN, Keyboard.DOWN, Keyboard.LEFT, Keyboard.RIGHT, Keyboard.LEFT, Keyboard.RIGHT, 66, 65];

		public function init(stage:Stage):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
		}

		private function keydown(e:KeyboardEvent):void {
			if ( oass[count] == e.keyCode ) {
				count++;
				if ( count == oass.length ) {
					_isOpen=true;
					count = 0;
					dispatchEvent(new Event(Event.OPEN));
				}
			} else {
				count = 0;
			}
		}

		public function get isOpen() : Boolean {
			return _isOpen;
		}
	}
}