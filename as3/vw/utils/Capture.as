package vw.utils {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;

	/**
	 * Capture
	 * @author Takashi Murai (vesperoworks)
	 */
	public class Capture extends Bitmap {

		private var _bmd:BitmapData;

		public function Capture(target:DisplayObject) {
			_bmd = new BitmapData(target.width, target.height, true, 0x000000);
			_bmd.draw(target, target.transform.matrix,target.transform.colorTransform,null,null,true);
			bitmapData=_bmd;
		}
	}
}