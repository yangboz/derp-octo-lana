
package
{
	import com.derp_octo_lana.app.consts.FlexGlobals;
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.views.MainView;
	import com.godpaper.as3.utils.LogUtil;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import mx.logging.ILogger;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.core.Starling;
	
	
	/**
	 * Main.as class.The Starling+Robotlegs entry point class.
	 * @see https://github.com/s9tpepper/robotlegs-starling-plugin
	 * @see https://github.com/chasevida/Starling-Robotlegs-simple-boilerplate
	 * 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 10:24:04 PM
	 * @history 05/00/12,
	 */ 
	//
//	[SWF(frameRate="60", width="320", height="480", backgroundColor="0xffffff")] //320×480 for iPhone devices
	//	[SWF(frameRate="60", width="384", height="512", backgroundColor="0xffffff")]//384×512 for iPad devices
	[SWF(frameRate="60", width="640", height="480", backgroundColor="0xffffff")] //1024×768 for ipad retina devices
	public class Main extends Sprite
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _starling:Starling;
		private var _starlingContext:StarlingContext;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(Main);
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Protected properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function Main()
		{
			super();
			//
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Protected methods
		//
		//--------------------------------------------------------------------------
		protected function onAddedToStage(event:Event):void
		{
			_starling = new Starling(MainView, stage);
			_starling.start();
			FlexGlobals.flashStage=stage;
			// loader info.
			this.loaderInfo.addEventListener(flash.events.Event.COMPLETE, loaderInfoCompleteHandler);
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		//
		private function loaderInfoCompleteHandler(event:flash.events.Event):void
		{
			LOG.debug("creationCompleteHandler@loaderInfo_complete");
			//
			this.stage.addEventListener(flash.events.Event.RESIZE, stageResizeHandler, false, 0, true);
			//Deative,active event listeners.
			//			this.stage.addEventListener(Event.DEACTIVATE, stageDeactivateHandler, false, 0, true);
		}
		//
		private function stageResizeHandler(event:flash.events.Event):void
		{
			LOG.debug("stage_resizeHandler");
			this._starling.stage.stageWidth=this.stage.stageWidth;
			this._starling.stage.stageHeight=this.stage.stageHeight;
			
			const viewPort:Rectangle=this._starling.viewPort;
			viewPort.width=this.stage.stageWidth;
			viewPort.height=this.stage.stageHeight;
			try
			{
				this._starling.viewPort=viewPort;
			}
			catch (error:Error)
			{
			}
		}

	}
	
}