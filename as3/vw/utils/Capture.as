package vw.utils {

	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;

	/**
	 * Capture
	 * @author Takashi Murai (vesperoworks)
	 */
	public class Capture extends Bitmap {

		private var _bmd:BitmapData;
		private var target:DisplayObject;

		public function Capture(target:DisplayObject) {
			this.target = target;
			_bmd = new BitmapData(target.width, target.height, true, 0x00000000);
			_bmd.draw(target, target.transform.matrix, target.transform.colorTransform, null, null, true);

			bitmapData = _bmd;
		}

		public function start():void {
			if (!hasEventListener(Event.ENTER_FRAME)) addEventListener(Event.ENTER_FRAME, loop);
		}

		public function stop():void {
			if (hasEventListener(Event.ENTER_FRAME)) removeEventListener(Event.ENTER_FRAME, loop);
		}

		private function loop(e:Event):void {
			_bmd.draw(target, target.transform.matrix, target.transform.colorTransform, null, null, true);
			bitmapData = _bmd;
		}
	}
}