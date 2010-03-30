package vw.model {
	import flash.events.DataEvent;
	import flash.events.EventDispatcher;

	/**
	 * @author Takashi Murai (vesperworks)
	 * @usage
	 * var switcher:Toggle=new Toggle([true,false,true,true])
	 * switcher.addSwitch()
	 * switcher.delSwitch()
	 * switcher.on()
	 * switcher.off()
	 * switcher.addEventListener(Toggle.ON,function(e:DataEvent){
	 * 	trace(int(e.data),"is swhtch ON")
	 * })
	 * switcher.addEventListener(Toggle.OFF,function(e:DataEvent){
	 * 	trace(int(e.data),"is swhtch OFF")
	 * })
	 */
	public class Toggle extends EventDispatcher {

		public static const ON:String = "switch_on";
		public static const OFF:String = "switch_off";
		//		public static const ERROR:String="switch_error"
		private var history:Array;
		private var switches:Array;

		public function Toggle(isON:Boolean = false) {
			history = new Array();
			switches = new Array();

			init([isON]);
		}

		private function init(arr:Array):void {
			switches = arr.slice();
			update();
		}

		private function update():void {
			switches.forEach(function(val:*, key:int, arr:Array):void {
				if (Boolean(val) != history[key]) {
					var nextEvent:String = Boolean(val) ? ON : OFF;
					dispatchEvent(new DataEvent(nextEvent, false, false, String(key)));
				}
			});
			history = switches.slice();
		}

		public function addSwitch(defaultSwitch:Boolean = false):void {
			switches.push(defaultSwitch);
			update();
		}

		public function delSwitch(switchIndex:uint = 0):void {
			switches.splice(switchIndex, 1);
			update();
		}

		public function on(index:uint = 0):void {
			switches[index] = true;
			update();
		}

		public function off(index:uint = 0):void {
			switches[index] = false;
			update();
		}

		public function toggle(index:uint = 0):void {
			switches[index] = !switches[index];
			update();
		}

		public function toArray():Array {
			return switches;
		}
	}
}