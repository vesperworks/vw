﻿package vw.model {

	import flash.display.*;	/**	 * @author Takashi Murai(KAYAC)	 */	public class Context {		private static var _stage:Stage;		private static var _layer:DisplayObjectContainer;
		private static var _config:Object = {};
		public static function get stage():Stage {			return _stage;		}		public static function set stage(value:Stage):void {			_stage = value;		}		public static function get layer():DisplayObjectContainer {			return _layer;		}		public static function set layer(value:DisplayObjectContainer):void {			_layer = value;		}		public static function get config():Object {			return _config;		}		public static function set config(value:Object):void {			_config = value;		}	}}