package vw.sound {
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
	public class MainVolume {

		private static var soundToggle:Toggle;
		private static var tmp:Object = {vol:1};
		private static var tween:IObjectTween;
		private static var btnz:Array = [];
		{
		soundToggle = new Toggle(true);
		soundToggle.addEventListener(Toggle.ON, function(e:Event):void {
			tween.play();
			update(true);
		});
		soundToggle.addEventListener(Toggle.OFF, function(e:Event):void {
			BetweenAS3.reverse(tween).play();
			update(false);
		});
				
		tween = BetweenAS3.tween(tmp, {vol:1}, {vol:0}, 1.0);
		tween.onUpdate = function():void {
			MainVolume.volume(tmp.vol);
		};
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
