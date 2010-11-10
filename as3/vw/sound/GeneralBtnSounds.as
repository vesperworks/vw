package vw.sound {

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	/**
	 
	public class GeneralBtnSounds extends EventDispatcher{
		public static const OVER:String="SOUND_OVER";
		public static const CLICK:String="SOUND_CLICK";
		

		public function over() : void {
			dispatchEvent(new Event(GeneralBtnSounds.OVER));
		}

		public function click() : void {
			dispatchEvent(new Event(GeneralBtnSounds.CLICK));
		}
	}