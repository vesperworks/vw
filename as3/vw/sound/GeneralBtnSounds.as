package vw.sound {

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	/**	 * @author Takashi Murai (KAYAC)	 */
	 
	public class GeneralBtnSounds extends EventDispatcher{				private static var __instance:GeneralBtnSounds;
		public static const OVER:String="SOUND_OVER";
		public static const CLICK:String="SOUND_CLICK";
				/**		 * @return singleton instance of GeneralBtnSounds		 */		public static function get instance() : GeneralBtnSounds {			if (__instance == null) __instance = new GeneralBtnSounds;			return __instance;		}				public function GeneralBtnSounds() {					}

		public function over() : void {
			dispatchEvent(new Event(GeneralBtnSounds.OVER));
		}

		public function click() : void {
			dispatchEvent(new Event(GeneralBtnSounds.CLICK));
		}
	}}