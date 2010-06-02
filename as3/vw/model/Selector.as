package vw.model {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Takashi Murai (vesperworks)
	 * @usage
	 * var selector:Option=new Option([true,false,true,true])
	 * selector.select(index)
	 * selector.addEventListener(Option.CHANGE,function(e:Event){
	 * 	trace(selector.status)
	 * 	//out : [false,false,ture,false]
	 * })
	 */
	[Event(name="change", type="flash.events.Event")]

	public class Selector extends EventDispatcher {

		private var history:Array;
		private var _status:Array;

		public function Selector(selectorLength:int = 2) {
			history = new Array();
			_status = new Array(true);
			for (var i:int = 1;i < selectorLength;i++) {
				_status.push(false);
			}
			update(0);
		}

		private function update(changedIndex:uint):void {
			for (var i:int = 0;i < _status.length;i++) {
				_status[i] = false;
			}
			_status[changedIndex] = true;
//			var isChanged:Boolean = !_status.every(function(val:*, key:int, arr:Array):Boolean {
//				return Boolean(val) == history[key];
//			});
//			if(isChanged)
			dispatchEvent(new Event(Event.CHANGE));
			history = _status.slice();
		}

		public function select(index:uint = 0):void {
			_status[index] = true;
			update(index);
		}

		public function get status():Array {
			return _status;
		}
	}
}