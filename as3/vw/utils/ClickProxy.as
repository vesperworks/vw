package vw.utils {
	import flash.events.*;
	import flash.utils.*;

	/**
	 * @author Takashi Murai (vesperworks)
	 */
	public class ClickProxy {

		private static var __instance:ClickProxy;
		private const delay:uint = 200;
		private var _timer:Timer;
		public var timerFunc:Function;
		public var arg:*;
		private var _isInited:Boolean = false;

		public static function get instance():ClickProxy {
			if (__instance === null) {
				__instance = new ClickProxy;
			}
			return __instance;
		}

		private function init():void {
			_timer = new Timer(delay, 1);
			_isInited = true;
			//
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:Event):void {
				timerFunc.apply(null, [arg]);
			});
		}

		public function setClick(_func:Function, _any:*= null):void {
			timerFunc = _func;
			arg = _any;
			//		
			if (!_isInited) {
				init();
			}

			_timer.reset();
			_timer.start();
		}
	}
}