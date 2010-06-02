package vw.utils {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Call {

		private static var engine:MovieClip = new MovieClip();

		public static function later(func:Function, args:Array = null, frame:int = 1):void {
			engine.addEventListener(Event.ENTER_FRAME, function(event:Event):void {
				if (--frame <= 0) {
					engine.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					func.apply(null, args);
				}
			});
		}

		public static function repeat(func:Function, args:Array = null, count:int = 1,intervalFrame:int = 1):void {
			var interval:int = 0;
			engine.addEventListener(Event.ENTER_FRAME, function(event:Event):void {
				if (--interval <= 0) {
					func.apply(null, args);
					interval = intervalFrame;
					if(--count<=0){
						engine.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					}
				}
			});
		}
	}
}