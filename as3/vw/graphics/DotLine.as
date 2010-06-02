package vw.graphics {
	import flash.display.Shape;
	import flash.geom.Rectangle;

	public class DotLine extends Shape {

		private var _color:int;
		private var _size:Number;
		private var _pattern:Array;
		private var _width:Number;
		private var _height:Number;
		private var _fillColor:int = -1;

		public function DotLine(pattern:Array = null,size:Number = 2,color:int = 0x000000,width:Number = 0,height:Number = 0) {
			_pattern = pattern ? pattern : [1,1];
			_size = size;
			_color = color;
			_width = width;
			_height = height;
			draw();
		};

		private function draw():void {
			if(_width == 0 || _height == 0)return;

			this.graphics.clear();

			var rect:Rectangle = new Rectangle(0, 0, _width, _height);
			rect.x = Math.min(rect.width, 0);
			rect.y = Math.min(rect.height, 0);
			rect.width = Math.abs(rect.width);
			rect.height = Math.abs(rect.height);

			var max:Number = Math.max(rect.width, rect.height);
			var tempNum:Number = 0;
			var patternLength:int = Math.round(pattern.length / 2);
			if (_fillColor > -1) {
				this.graphics.beginFill(_fillColor);
				this.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
				this.graphics.endFill();
			}
			while (max > tempNum) {
				for (var i:int = 0;i < patternLength;i++) {
					var h:Number;
					if(rect.height > tempNum) {
						h = Math.min(pattern[i * 2], rect.height - tempNum);
						this.graphics.beginFill(color);
						this.graphics.drawRect(rect.x, rect.y + tempNum, size, h);
						this.graphics.beginFill(color);
						this.graphics.drawRect(rect.right - size, rect.bottom - (tempNum + h), size, h);
						this.graphics.endFill();
					}
					if(rect.width > tempNum) {
						h = Math.min(pattern[i * 2], rect.width - tempNum);
						this.graphics.beginFill(color);
						this.graphics.drawRect(rect.x + tempNum, rect.y, h, size);
						this.graphics.beginFill(color);
						this.graphics.drawRect(rect.right - (tempNum + h), rect.bottom - size, h, size);
						this.graphics.endFill();
					}
					tempNum += pattern[i * 2];
					if(pattern.length > i * 2 + 1) {
						tempNum += pattern[i * 2 + 1];
					}
				}
			}
		}

		public function get fillColor():int {
			return _fillColor;
		}

		public function set fillColor(value:int):void {
			_fillColor = value;
			draw();
		}

		public function get color():int {
			return _color;
		}

		public function set color(value:int):void {
			_color = value;
			draw();
		}

		public function get pattern():Array {
			return _pattern;
		}

		public function set pattern(array:Array):void {
			_pattern = array;
			draw();
		}

		public function get size():Number {
			return _size;
		}

		public function set size(value:Number):void {
			_size = value;
			draw();
		}

		override public function set width(value:Number):void {
			_width = value;
			draw();
		}

		override public function set height(value:Number):void {
			_height = value;
			draw();
		}
	}
}

