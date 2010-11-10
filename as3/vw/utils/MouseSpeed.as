package vw.utils {

	import flash.display.Stage;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author Takashi Murai (KAYAC)
	 */

	public class MouseSpeed extends Sprite {

		private var history:Point = new Point(0, 0);
		private var now:Point = new Point(0, 0);
		private var target:Stage;
		private static var __instance:MouseSpeed;
		private var _diffX:Number;
		private var _diffY:Number;
		private var _diffV:Number;
		private var isInitialized:Boolean=false;

		/**
		 * @return singleton instance of MouseSpeed
		 */
		public static function get instance() : MouseSpeed {
			if (__instance == null)
				__instance = new MouseSpeed;
			return __instance;
		}

		public function MouseSpeed() {
		}

		public function init(stage:Stage) : void {
			if(isInitialized)return;
			isInitialized = true;
			target = stage;
			addEventListener(Event.ENTER_FRAME, watching);
		}

		private function watching(e:Event = null):void {
			now.x = target.mouseX;
			now.y = target.mouseY;

			_diffX = history.x - now.x;
			_diffY = history.y - now.y;
			_diffV = Point.distance(history, now);

			history = now.clone();

		}

		public function get diffX() : Number {
			return _diffX;
		}

		public function get diffY() : Number {
			return _diffY;
		}

		public function get diffV() : Number {
			return _diffV;
		}

	}
}
