package vw.ui {

	import vw.sound.GeneralBtnSounds;

	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class NoneBtnAnimation {

		public static function setup(target:Sprite, soundActive:Boolean = true):Sprite {
			target.addEventListener(MouseEvent.MOUSE_DOWN, _down);
			target.addEventListener(MouseEvent.MOUSE_UP, _up);
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

		public static function clear(target:Sprite, soundActive:Boolean = true):void {
			target.removeEventListener(MouseEvent.MOUSE_DOWN, _down);
			target.removeEventListener(MouseEvent.MOUSE_UP, _up);
			target.removeEventListener(MouseEvent.ROLL_OUT, _out);
			target.removeEventListener(MouseEvent.ROLL_OVER, _over);

			if (soundActive) target.removeEventListener(MouseEvent.MOUSE_DOWN, _downS);
			if (soundActive) target.removeEventListener(MouseEvent.ROLL_OVER, _overS);
		}

		public static function active(target:Sprite):void {
			target.mouseEnabled = true;
			target.buttonMode = true;
		}

		public static function passive(target:Sprite):void {
			target.mouseEnabled = false;
			target.buttonMode = false;
		}

		private static function _up(e:MouseEvent):void {
		}

		private static function _down(e:MouseEvent):void {
		}

		private static function _out(e:MouseEvent):void {
		}

		private static function _over(e:MouseEvent):void {
		}

		private static function _overS(e:MouseEvent):void {
			GeneralBtnSounds.instance.over();
		}

		private static function _downS(e:MouseEvent):void {
			GeneralBtnSounds.instance.click();
		}
	}
}

