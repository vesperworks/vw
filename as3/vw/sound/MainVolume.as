package vw.sound {
	import flash.events.EventDispatcher;
	import flash.display.MovieClip;

	import org.libspark.betweenas3.tweens.IObjectTween;
	import org.libspark.betweenas3.BetweenAS3;

	import flash.events.Event;

	import vw.model.Toggle;

	import flash.media.SoundTransform;
	import flash.media.SoundMixer;

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class MainVolume extends EventDispatcher {

		private static var soundToggle:Toggle;
		private static var tmp:Object = {vol:1};
		private static var tween:IObjectTween;
		private static var btnz:Array = [];
		private static var __instance:MainVolume;
		public static const ON:String = "MainVolumeON";
		public static const OFF:String = "MainVolumeOFF";
		{
		soundToggle = new Toggle(true);
		soundToggle.addEventListener(Toggle.ON, function(e:Event):void {
			tween.play();
			update(true);
			instance.dispatchEvent(new Event(ON));
		});
		soundToggle.addEventListener(Toggle.OFF, function(e:Event):void {
			BetweenAS3.reverse(tween).play();
			update(false);
			instance.dispatchEvent(new Event(OFF));
		});
					
		tween = BetweenAS3.tween(tmp, {vol:1}, {vol:0}, 1.0);
		tween.onUpdate = function():void {
			MainVolume.volume(tmp.vol);
		};
		
		}

		/**
		 * @return singleton instance of MainVolume
		 */
		public static function get instance():MainVolume {
			if (__instance == null) __instance = new MainVolume;
			return __instance;
		}

		public static function addBtn(btn:MovieClip):void {
			btnz.push(btn);
		}

		public static function removeBtn(btn:MovieClip):void {
			btnz = btnz.filter(function (item:*, index:int, array:Array):Boolean {
				return (array[index] != btn && array[index] != null);
			});
		}

		private static function update(flag:Boolean):void {
			btnz = btnz.filter(function (item:*, index:int, array:Array):Boolean {
				return (array[index] != null);
			});
			for (var i:int = 0;i < btnz.length;i++) {
				btnz[i].gotoAndStop(flag ? 1 : 2);
			}
		}

		public static function volume(volumeRatio:Number):void {
			SoundMixer.soundTransform = new SoundTransform(volumeRatio);
			if((volumeRatio>0)){
				update(true);
				instance.dispatchEvent(new Event(ON));
			}else{
				update(false);
				instance.dispatchEvent(new Event(OFF));
			}
		}
		
		public static function maxVolume(volumeRatio:Number):void{
			MainVolume.volume(volumeRatio);
			tween = BetweenAS3.tween(tmp, {vol:volumeRatio}, {vol:0}, 1.0);
			tween.onUpdate = function():void {
				MainVolume.volume(tmp.vol);
			};
		}
		
		public static function activeSound():void {
			trace("active");
			soundToggle.load();			
		}
		
		public static function deactiveSound():void {
			trace("deactive");
			soundToggle.save();
			soundToggle.off();	
		}

		public static function mute():void {
			soundToggle.off();
		}

		public static function unmute():void {
			soundToggle.on();
		}

		public static function toggle():void {
			soundToggle.toggle();
		}
	}
}
