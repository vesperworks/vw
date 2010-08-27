package vw.utils {
	import flash.system.Security;
	import flash.events.SecurityErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.EventDispatcher;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	 
	 //usage
	 //NetworkStatus.instance.addEventListener(NetworkStatus.ONLINE,online);
	 //NetworkStatus.instance.addEventListener(NetworkStatus.OFFLINE, offline);
	 //NetworkStatus.instance.init();
	 
	public class NetworkStatus extends EventDispatcher {

		private static var __instance:NetworkStatus;
		public static const ONLINE:String = "ONLINE";
		public static const OFFLINE:String = "OFFLINE";
		private var status:Boolean = true;
		private var timer:Timer;
		private var checkingFileURL:String;
		private var loader:URLLoader;
		private var history:Boolean = true;

		/**
		 * @return singleton instance of NetworkStatus
		 */
		public function get online():Boolean {
			return status;
		}

		public function get offline():Boolean {
			return !status;
		}

		public static function get instance():NetworkStatus {
			if (__instance == null) __instance = new NetworkStatus;
			return __instance;
		}

		public function NetworkStatus() {
		}

		public function init(checkingFilePath:String = "http://www.kayac.com/"):void {
			timer = new Timer(5000);
			timer.addEventListener(TimerEvent.TIMER, connect);
			checkingFileURL = checkingFilePath;
			connect();
			timer.start();
		}

		private function connect(e:TimerEvent=null):void {
			if(loader)return;
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loaded);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR, error);
			loader.load(new URLRequest(checkingFileURL + "?q=" + String(new Date().time) + String(Math.random() * 9999 >> 0)));
		}

		private function error(e:IOErrorEvent):void {
			status = false;
			update();
		}

		private function loaded(e:Event):void {
			status = true;
			update();
		}

		private function update():void {
			loader.close();
			loader = null;
			if(history != status){
				if(online){
					dispatchEvent(new Event(ONLINE));
				}else{
					dispatchEvent(new Event(OFFLINE));
				}
			}
			history = status;
		}

		public function kill():void {
			timer.stop();
			loader.close();
			loader = null;
			__instance = null;
		}
	}
}