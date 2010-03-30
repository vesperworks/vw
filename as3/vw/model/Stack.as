package vw.model {
	import flash.events.EventDispatcher;
	import flash.events.Event;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Stack extends EventDispatcher {

		public static const CHANGE_STACK:String = "change_stack";
		private var total:Array;
		private var inner:Array;
		private var step:Stepper;

		public function Stack(originalArray:Array,trancateLength:int) {
			total = originalArray;
			
			var range:int = total.length - trancateLength;
			step = new Stepper(0, range);
			step.addEventListener(Stepper.CHANGE, change);
		}

		public function getScopeStack():Array {
			return inner;
		}

		public function getTotalStack():Array {
			return total;
		}

		public function prev():void {
			step.prev();
		}

		public function next():void {
			step.next();
		}

		public function right():void {
			step.next();
		}

		public function left():void {
			step.prev();
		}

		private function change(e:Event = null):void {
			inner = total.slice(step.page, step.page + step.max);
			dispatchEvent(new Event(CHANGE_STACK));
		}
	}
}
