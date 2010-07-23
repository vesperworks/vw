package vw.utils {
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	[Event(name="change", type="flash.events.Event")]

	public class Watcher extends Sprite {

		private var watchingValueName:String;
		private var watchingScope:Object;
		private var history:*;
		private var now:*;

		public function Watcher(scope:Object,valueName:String) {
			
			watchingScope = scope;
			watchingValueName = valueName;
		}

		public function start():void {
			if(!hasEventListener(Event.ENTER_FRAME))addEventListener(Event.ENTER_FRAME, watching);
		}

		public function stop():void {
			if(hasEventListener(Event.ENTER_FRAME))removeEventListener(Event.ENTER_FRAME, watching);
		}

		public function check():void {
			watching();			
		}

		private function watching(e:Event = null):void {
			now = watchingScope[watchingValueName];
			
			if(now != history) {
				dispatchEvent(new Event(Event.CHANGE));
			}
			
			history = watchingScope[watchingValueName];
		}

		public function get value():* {
			return now;
		}
	}
}
