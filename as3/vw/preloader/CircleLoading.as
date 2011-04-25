package vw.preloader {

	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.*;

	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.*;
	[SWF(width=465, height=465, backgroundColor=0x0, frameRate=30)]
	
	public class CircleLoading extends Sprite {

		private var PATH:String = "";
		private var CONTEXT:LoaderContext;
		private var arcA:Arc;
		private var arcB:Arc;
		private var loader:Loader;
		private var per:Number = 0;
		private var tf:TextField;

		public function CircleLoading(swfPath:String, context:LoaderContext = new LoaderContext()) {
			PATH = swfPath;
			CONTEXT = context;
			if( !stage )
				this.addEventListener(Event.ADDED_TO_STAGE, init);//
			else
				init();
		}

		private function init(e:Event = null):void {
			if( e )
				this.removeEventListener(Event.ADDED_TO_STAGE, init);

			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.OPEN, onOpen);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(PATH));

			arcA = new Arc(0, 90, 0x003366);
			arcB = new Arc(360, 100, 0x00ccff);
			arcA.x = arcB.x = stage.stageWidth * 0.5 | 0;
			arcA.y = arcB.y = stage.stageHeight * 0.5 | 0;
			tf = new TextField();
			tf.defaultTextFormat = new TextFormat('standard 07_65', 8, 0xFFFFFF);
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.antiAliasType = AntiAliasType.NORMAL;
			tf.text = "LOADING";
			tf.x = arcB.x - (tf.textWidth * 0.5 | 0);
			tf.y = arcB.y - (tf.textHeight * 0.5 | 0);

			BetweenAS3.serial(
				BetweenAS3.parallel(
					BetweenAS3.addChild(arcB, this), 
					BetweenAS3.addChild(arcA, this)
				), 
				BetweenAS3.parallel(
					BetweenAS3.tween(arcB, {scaleX:1, scaleY:1}, {scaleX:0, scaleY:0}, 0.4, Back.easeOut)
				), 
				BetweenAS3.addChild(tf, this), 
				BetweenAS3.tween(tf, {alpha:1}, {alpha:0}, 0.3), 
				BetweenAS3.func(tweenArc)
			);
		}

		private function onOpen(e:Event):void {
			loader.contentLoaderInfo.removeEventListener(Event.OPEN, onOpen);
		}

		private function onProgress(e:ProgressEvent):void {
			per = e.bytesLoaded / e.bytesTotal * 100;
		}

		private function onComplete(e:Event):void {
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
		}
		
		private function tweenArc():void
		{
			if( arcA.angle >= 360 ){
				BetweenAS3.serial(
					BetweenAS3.func( function():void{
						tf.text = "COMPLETE!";
						tf.x = arcB.x - (tf.textWidth*0.5 | 0);
					}),
					BetweenAS3.delay(
						BetweenAS3.to( tf, {alpha:0}, 0.2)
						, 0.6
					),
					BetweenAS3.parallel(
						BetweenAS3.to( arcA, {width:0, height:0}, 0.4, Back.easeIn),
						BetweenAS3.to( arcB, {width:10, height:10}, 0.4, Back.easeIn)
					),
					BetweenAS3.removeFromParent( tf ),
					BetweenAS3.removeFromParent( arcA ),
					BetweenAS3.removeFromParent( arcB )
				).play();
			}else{
				BetweenAS3.serial(
					BetweenAS3.to( arcA, {angle:per*3.6}, 0.5, Expo.easeOut),
					BetweenAS3.func( tweenArc )//
				).play();
			}
		}
		
	}
}


import flash.display.*;
import flash.geom.Point;

class Arc extends Sprite
{
	private var _angle:Number;
	private var _radius:Number;
	private var _fillColor:uint;
	private var _stroke:Number;
	private var _strokeColor:uint;
	
	public function Arc( angle:Number, radius:Number, fillColor:uint=0, stroke:Number=0, strokeColor:uint=0)
	{
		this._radius = radius;
		this._fillColor = fillColor;
		this._stroke = stroke;
		this._strokeColor = strokeColor;
		draw( angle );//
	}
	
	public function draw( angle:Number ):void
	{
		var g:Graphics = this.graphics;
		g.clear();
		if( _stroke >0  ) g.lineStyle( _stroke, _strokeColor);
		g.beginFill( _fillColor );
		
		if( angle == 0 ){
		}else  if( angle%360 == 0 ){
			g.drawCircle( 0, 0, _radius);
			
		}else{
			angle = (angle%360 + 360)%360;
			g.moveTo( 0, 0);
			
			var l:int = (angle/45 + 0.5) | 0;
			for(var i:int=0; i<l; i++){
				var rad0:Number = ( (i*45) - 90)*Math.PI/180;
				var rad1:Number = ( Math.min( (i+1)*45, angle) - 90)*Math.PI/180;
				var a0:Point = new Point( Math.cos(rad0)*_radius, Math.sin(rad0)*_radius);
				var a1:Point = new Point( Math.cos(rad1)*_radius, Math.sin(rad1)*_radius);
				var rad2:Number = (rad1 - rad0)*0.5;
				var r:Number = _radius/Math.cos(rad2);
				var c:Point = new Point( Math.cos(rad2+rad0)*r, Math.sin(rad2+rad0)*r);
				
				g.lineTo( a0.x, a0.y);
				g.curveTo( c.x, c.y, a1.x, a1.y);
			}
			g.lineTo( 0, 0);
		}
		
		g.endFill();
		this._angle = angle;
	}

	public function get angle():Number{ return _angle; }
	public function set angle( value:Number ):void{ draw( value ); }
}