package vw.model {
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Takashi Murai (vesperworks)
	 * @usage
	 * var switcher:Toggle=new Toggle(true)
	 * switcher.on()
	 * switcher.off()
	 * switcher.addEventListener(Toggle.ON,function(e:DataEvent){
	 * 	trace(int(e.data),"is swhtch ON")
	 * })
	 * switcher.addEventListener(Toggle.OFF,function(e:DataEvent){
	 * 	trace(int(e.data),"is swhtch OFF")
	 * })
	 */
	[Event(name="switch_on", type="flash.events.Event")]

	[Event(name="switch_off", type="flash.events.Event")]

	public class Toggle extends EventDispatcher {

		public static const ON:String = "switch_on";
		public static const OFF:String = "switch_off";
		//		public static const ERROR:String="switch_error"
		private var _status:Boolean;
		private var history:Boolean;
		private var memory:Boolean;

		public function Toggle(isON:Boolean = false) {
			init(isON);
		}

		private function init(initialBool:Boolean):void {
			_status = initialBool;
			memory = _status;
			update();
		}

		private function update():void {
			if (_status != history) {
				var nextEvent:String = _status ? ON : OFF;
				dispatchEvent(new Event(nextEvent));
			}
			history = _status;
		}

		public function save():void {
			memory = _status;
		}

		public function load():void {
			_status = memory;
			update();
		}

		public function on():void {
			_status = true;
			update();
		}

		public function off():void {
			_status = false;
			update();
		}

		public function toggle():void {
			_status = !_status;
			update();
		}

		public function get status():Boolean {
			return _status;
		}

		public function set status(newStatus:Boolean):void {
			_status = newStatus;
			update();
		}
	}
}