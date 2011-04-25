package vw.utils {

	import flash.display.Stage;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Screen {

		private static var targetStage:Stage;
		private static var _minimumWidth:Number = 960;
		private static var _minimumHieght:Number = 540;

		public static function init(stage:Stage):void {
			targetStage = stage;
		}

		public static function unlock():void {
			targetStage.mouseChildren = true;
			trace("SCreen.unlock()");
		}

		public static function lock():void {
			targetStage.mouseChildren = false;
			trace("SCreen.lock()");
		}

		static public function get height():Number {
			return targetStage.stageHeight < minimumHieght ? minimumHieght : targetStage.stageHeight;
		}

		static public function get width():Number {
			return targetStage.stageWidth < minimumWidth ? minimumWidth : targetStage.stageWidth;
		}

		static public function get minimumHieght():Number {
			return _minimumHieght;
		}

		static public function set minimumHieght(minimumHieght:Number):void {
			_minimumHieght = minimumHieght;
		}

		static public function get minimumWidth():Number {
			return _minimumWidth;
		}

		static public function set minimumWidth(minimumWidth:Number):void {
			_minimumWidth = minimumWidth;
		}

		static public function get top():Number {
			return 0;
		}

		static public function get middle():Number {
			return targetStage.stageHeight < minimumHieght ? minimumHieght/2 : targetStage.stageHeight/2;
		}
		
		static public function get bottom():Number {
			return targetStage.stageHeight < minimumHieght ? minimumHieght : targetStage.stageHeight;
		}

		static public function get left():Number {
			return 0;
		}

		static public function get center():Number {
			return targetStage.stageWidth < minimumWidth ? minimumWidth/2 : targetStage.stageWidth/2;
		}
		static public function get right():Number {
			return targetStage.stageWidth < minimumWidth ? minimumWidth : targetStage.stageWidth;
		}

	}
}
