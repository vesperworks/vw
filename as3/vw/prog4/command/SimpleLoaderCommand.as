package vw.prog4.command {
	import jp.progression.commands.Command;

	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.system.LoaderContext;

	public class SimpleLoaderCommand extends Command {

		public var ioErrorHandler:Function;
		private var _loader:Loader;
		private var _req:URLRequest;
		private var _context:LoaderContext;
		private var _initObject:Object;

		public function SimpleLoaderCommand(req:URLRequest, context:LoaderContext = null,  ioErrorHandler:Function = null, initObject:Object = null) {
			//_loader = loader;
			_req = req;
			_req.data = new URLVariables('t=' + (new Date).time);
//			trace("loading URL... ",_req.url);
			_context = context;
			this.ioErrorHandler = ioErrorHandler;
			
//			_loader = new Loader;
//			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _completeHandler);
//			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
//			_loader.contentLoaderInfo.addEventListener(Event.OPEN, trace);
			//_loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
			_initObject = initObject;
			super(_executeFunction, _interruptFunction, initObject);
		}
		
		private function onStatus(e:HTTPStatusEvent):void 
		{
			//if (e.status == 200) {
				//_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _completeHandler);
				//_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
				//super.latestData = _loader;
				//
				//super.executeComplete();
			//}
		}

		private function _ioErrorHandler(e:IOErrorEvent):void {
//			_loader.close();
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _completeHandler);
			if (ioErrorHandler != null)
				ioErrorHandler();
		
			super.executeComplete();	
//			trace(e);
//			super.throwError(this, new IOError('failed to load url : ' + _req.url));
		}

		private function _completeHandler(e:Event):void {
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _completeHandler);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
			super.latestData = _loader;
			
			super.executeComplete();
		}

		private function _executeFunction():void {
//			trace('execute');
			if(_loader) {
				_loader.unload();
				_loader = null;
			}
			_loader = new Loader;
			if(!_loader.contentLoaderInfo.hasEventListener(Event.COMPLETE))_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _completeHandler);
			if(!_loader.contentLoaderInfo.hasEventListener(IOErrorEvent.IO_ERROR))_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
			_req.data = new URLVariables('t=' + (new Date).time);
			_loader.load(_req, _context);
		}

		private function _interruptFunction():void {
			if (_loader) {
				try {
					_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _completeHandler);
					_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
				} catch (e:Error) {
				}
			}
		}
		
		override public function clone():Command 
		{
			return new SimpleLoaderCommand(_req, _context, ioErrorHandler, _initObject);
		}
	}
}