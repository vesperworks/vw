package vw.prog4.command {
	import flash.display.Loader;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	import jp.progression.commands.Command;

	public class SimpleLoaderCommand extends Command {

		public var ioErrorHandler:Function;
		private var _loader:Loader;
		private var _req:URLRequest;
		private var _context:LoaderContext;

		public function SimpleLoaderCommand(loader:Loader, req:URLRequest, context:LoaderContext = null,  ioErrorHandler:Function = null, initObject:Object = null) {
			_loader = loader;
			_req = req;
			trace("loading URL... ",_req.url);
			_context = context;
			ioErrorHandler = ioErrorHandler;
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _completeHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
			
			super(_executeFunction, _interruptFunction, initObject);
		}

		private function _ioErrorHandler(e:IOErrorEvent):void {
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _ioErrorHandler);
			if (ioErrorHandler != null)
				ioErrorHandler();
				
			super.throwError(this, new IOError('failed to load url : '));
		}

		private function _completeHandler(e:Event):void {
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _completeHandler);
			
			super.executeComplete();
		}

		private function _executeFunction():void {
			_loader.load(_req, _context);
		}

		private function _interruptFunction():void {
			if (_loader) {
				try {
					_loader.close();
				} catch (e:Error) {
				}
			}
		}
	}
}