package vw.effect.fire {

	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class FireConfig {

		public var FADE:Number = 0.2;
		public var SCALE:Number = 0.65;
		public var DISTORTION_X:Number = 0.1;
		public var DISTORTION_Y:Number = 0.7;
		public var AMOUNT:Number = 0.48;
		public var SPREAD:Number = 0.9;
		public var SMOKE:Number = 0.9;

		public function FireConfig(fade:Number = 0.2, scale:Number = 0.65, distortionX:Number = 0.01, distortionY:Number = 0.7, amount:Number = 0.48, spread:Number = 0.6, smoke:Number = 0.9) {
			FADE = fade;
			SCALE = scale;
			DISTORTION_X = distortionX;
			DISTORTION_Y = distortionY;
			AMOUNT = amount;
			SPREAD = spread;
			SMOKE = smoke;
		}
	}
}
