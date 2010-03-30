package vw.effect {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;

	/**
	 * Glower
	 * @author Takashi Murai (vesperoworks)
	 */
	public class Glower extends Sprite {

		private var _blur:BlurFilter;
		private var _bmp:Bitmap;
		private var _bmd:BitmapData;
		private var _src:DisplayObject;

		public function Glower( w:Number, h:Number ) {
			init(w, h);
		}

		private function init( w:Number, h:Number ):void {
			_bmd = new BitmapData(w, h, true, 0x000000);
			_bmp = new Bitmap(_bmd);
			_blur = new BlurFilter(32, 32, 3);
		}

		public function setSrc( src:DisplayObject ):Glower {
			_src = src;
			return this;
		}

		public function getBmd():BitmapData {
			return _bmd;
		}

		public function start():Glower {
			this.addEventListener(Event.ENTER_FRAME, render);
			return this;
		}

		public function stop():Glower {
			this.removeEventListener(Event.ENTER_FRAME, render);
			return this;
		}

		private function render( e:Event ):void {
			_bmd.colorTransform(_bmd.rect, new ColorTransform(1, 1, 1, 0.50, 0, 0, 0, 0));
			_bmd.draw(_src);
			_bmd.applyFilter(_bmd, _bmd.rect, new Point(0, 0), _blur);
			_bmd.scroll(0, 0);
		}
	}
}