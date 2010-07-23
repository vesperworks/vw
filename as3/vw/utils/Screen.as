package vw.utils {
	import flash.display.Stage;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Screen {

		private static var targetStage:Stage;

		public static function init(stage:Stage):void {
			targetStage = stage;
		}

		public static function unlock():void {
			targetStage.mouseChildren = true;
		}

		public static function lock():void {
			targetStage.mouseChildren = false;
		}
	}
}
