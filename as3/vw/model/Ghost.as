package vw.model {
	import flash.display.DisplayObject;

	/**
	 * @author Takashi Murai (vesperworks)
	 */
	public class Ghost {

		public var _scaleX:Number = 1;
		public var _scaleY:Number = 1;
		public var _width:Number = 0;
		public var _height:Number = 0;
		public var _x:Number = 0;
		public var _y:Number = 0;

		public function Ghost(target:DisplayObject) {
			_scaleX = target.scaleX;
			_scaleY = target.scaleY;
			_width = target.width;
			_height = target.height;
			_x = target.x;
			_y = target.y;
		}

		public function get scaleX():Number {
			return _scaleX;
		}

		public function get scaleY():Number {
			return _scaleY;
		}

		public function get width():Number {
			return _width;
		}

		public function get height():Number {
			return _height;
		}

		public function get x():Number {
			return _x;
		}

		public function get y():Number {
			return _y;
		}
	}
}
