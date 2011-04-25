package vw.ui {

	import vw.sound.GeneralBtnSounds;

	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class FrameBtnAnimation {

		public static function setup(target:MovieClip, soundActive:Boolean = true, isClickMode:Boolean = false):MovieClip {
			if (!isClickMode) target.addEventListener(MouseEvent.MOUSE_DOWN, _down);
			if (!isClickMode) target.addEventListener(MouseEvent.MOUSE_UP, _up);
			if (isClickMode) target.addEventListener(MouseEvent.CLICK, _down);
			target.addEventListener(MouseEvent.ROLL_OUT, _out);
			target.addEventListener(MouseEvent.ROLL_OVER, _over);

			if (soundActive) target.addEventListener(MouseEvent.MOUSE_DOWN, _downS);
			if (soundActive) target.addEventListener(MouseEvent.ROLL_OVER, _overS);

			var area:Rectangle = target.getRect(target);
			with(target) {
				graphics.beginFill(0x000000, 0);
				graphics.drawRect(area.x, area.y, area.width, area.height);
				graphics.endFill();
			}

			target.mouseChildren = false;
			active(target);

			// target.gotoAndStop(1);
			
			return target;
		}

		public static function clear(target:MovieClip, soundActive:Boolean = true, isClickMode:Boolean = false):void {
			if (!isClickMode) target.removeEventListener(MouseEvent.MOUSE_DOWN, _down);
			if (!isClickMode) target.removeEventListener(MouseEvent.MOUSE_UP, _up);
			if (isClickMode) target.removeEventListener(MouseEvent.CLICK, _down);
			target.removeEventListener(MouseEvent.ROLL_OUT, _out);
			target.removeEventListener(MouseEvent.ROLL_OVER, _over);

			if (soundActive) target.removeEventListener(MouseEvent.MOUSE_DOWN, _downS);
			if (soundActive) target.removeEventListener(MouseEvent.ROLL_OVER, _overS);
		}

		public static function active(target:MovieClip):void {
			target.mouseEnabled = true;
			target.enabled = true;
			target.buttonMode = true;
		}

		public static function passive(target:MovieClip):void {
			target.mouseEnabled = false;
			target.enabled = false;
			target.buttonMode = false;
		}

		private static function _up(e:MouseEvent):void {
			e.currentTarget.gotoAndPlay("_up");
		}

		private static function _down(e:MouseEvent):void {
			e.currentTarget.gotoAndPlay("_down");
		}

		private static function _out(e:MouseEvent):void {
			if (e.currentTarget.mouseEnabled) {
				e.currentTarget.gotoAndPlay("_out");
			}
		}

		private static function _over(e:MouseEvent):void {
			e.currentTarget.gotoAndPlay("_over");
		}

		private static function _overS(e:MouseEvent):void {
			GeneralBtnSounds.instance.over();
		}

		private static function _downS(e:MouseEvent):void {
			GeneralBtnSounds.instance.click();
		}
	}
}

