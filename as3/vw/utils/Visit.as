package vw.utils {

	import flash.net.SharedObject;

	/**	 * @author Takashi Murai (KAYAC)	 */
	public class Visit {

		private static var __instance:Visit;
		private var _lastDate:Date;
		private var _isFirstTime:Boolean = false;
		private var so:SharedObject;
		private var SO_NAME:String="visitso";

		/**		 * @return singleton instance of Visit
		 */
		public static function get instance() : Visit {
			if (__instance == null)
				__instance = new Visit;
			return __instance;
		}

		public function Visit() {
		}

		public function save() : void {
			load();
			so.data.lastUpdate = new Date();
			so.flush();
		}

		public function clear() : void {
			so.clear();
		}

		private function load() : void {

			so = SharedObject.getLocal(SO_NAME);

			if(so.size == 0) {
				_isFirstTime = true;
				so.data.lastUpdate = new Date();
				so.flush();
			}

			_lastDate = so.data.lastUpdate;
		}

		public function get lastDate() : Date {
			return _lastDate;
		}

		public function get isFirstTime() : Boolean {
			return _isFirstTime;
		}

		public function set setSoName(name:String) : void {
			SO_NAME = name;
		}

	}
}