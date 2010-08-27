package vw.ui {

	import caurina.transitions.properties.DisplayShortcuts;
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.ColorShortcuts;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class ScaleBtnAnimation {

		public static var OVER_SCALE : Number = 1.2;

		public static function setup(target : MovieClip):MovieClip {
			ColorShortcuts.init();
			DisplayShortcuts.init();

			target.addEventListener(MouseEvent.MOUSE_DOWN, _down);
			target.addEventListener(MouseEvent.MOUSE_UP, _up);
			target.addEventListener(MouseEvent.ROLL_OUT, _out);
			target.addEventListener(MouseEvent.ROLL_OVER, _over);

			var area : Rectangle = target.getRect(target);
			with(target) {
				graphics.beginFill(0x000000, 0);
				graphics.drawRect(area.x, area.y, area.width, area.height);
				graphics.endFill();
			}

			target.mouseChildren = false;
			active(target);

			target.gotoAndStop(1);

			return target;
		}

		public static function clear(target : MovieClip):void {
			target.removeEventListener(MouseEvent.MOUSE_DOWN, _down);
			target.removeEventListener(MouseEvent.MOUSE_UP, _up);
			target.removeEventListener(MouseEvent.ROLL_OUT, _out);
			target.removeEventListener(MouseEvent.ROLL_OVER, _over);
		}

		public static function active(target : MovieClip):void {
			target.mouseEnabled = true;
			target.enabled = true;
			target.buttonMode = true;
		}

		public static function passive(target : MovieClip):void {
			target.mouseEnabled = false;
			target.enabled = false;
			target.buttonMode = false;
		}

		private static function _up(e : MouseEvent):void {
		}

		private static function _down(e : MouseEvent):void {
		}

		private static function _out(e : MouseEvent):void {
			if (e.currentTarget.mouseEnabled) {
				Tweener.addTween(e.currentTarget, {_scale:1, time:0.5, delay:0, transition:Equations.easeOutExpo, useFrames:false});
			}
		}

		private static function _over(e : MouseEvent):void {
			Tweener.addTween(e.currentTarget, {_scale:OVER_SCALE, time:0.5, delay:0, transition:Equations.easeOutExpo, useFrames:false});
		}
	}
}

