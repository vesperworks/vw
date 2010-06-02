package vw.graphics {
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class TransparentRect {

		public static function draw(target:Sprite):void {
			var area:Rectangle = target.getRect(target);
			
			with(target) {
				graphics.clear();
				graphics.beginFill(0x000000, 0);
				graphics.drawRect(area.x, area.y, area.width, area.height);
				graphics.endFill();
			}
		}
	}
}
