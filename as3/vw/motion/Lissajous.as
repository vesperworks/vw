package vw.motion {

	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author Takashi Murai (vesperworks)
	 */
	public class Lissajous extends Sprite {

		private var A:Number;  
		private var B:Number;
		private var a:Number;
		private var b:Number;
		private var deg:Number = 0;  
		private var nTime:Number = 0;  
		private var step:Number;  
		private var cx:Number; 
		private var cy:Number;  
		private var xPos:Number; 
		private var yPos:Number;
		private var sp:DisplayObject;

		public function Lissajous(target:DisplayObject,radius:Number = 20,speed:Number = 1,nA:Number = 2,nB:Number = 3) {
			sp = target;
			step = speed;
			//			sp.x = xPos;
			//			sp.y = yPos;
			A = radius;
			B = radius;
			cx = sp.x;
			cy = sp.y;
			
			a = nA;
			b = nB;
		}

		public function start():void {
			if(!hasEventListener(Event.ENTER_FRAME))this.addEventListener(Event.ENTER_FRAME, loop);
		}

		public function stop():void {
			if(hasEventListener(Event.ENTER_FRAME))this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function getPoint():Point{
			return new Point(A * Math.sin(a * nTime + deg) + cx,B * Math.sin(b * nTime) + cy);
		}

		private	function loop(e:Event):void {  
			nTime += step;
			xPos = A * Math.sin(a * nTime + deg) + cx;
			yPos = B * Math.sin(b * nTime) + cy;
			sp.x = xPos;
			sp.y = yPos;
		}  	
	}
}
