
package com.derp_octo_lana.app.views
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.godpaper.as3.utils.LogUtil;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Screen;
	
	import mx.logging.ILogger;
	
	import starling.events.Event;
	
	
	/**
	 * ScreenBase.as class. 
	 * @author Administrator
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created 2013-3-12 下午3:22:00
	 * @history 05/00/12,
	 */ 
	public class ScreenBase extends Screen
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		protected static const LOG:ILogger = LogUtil.getLogger(HelpScreen);
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
		protected var _backBtn : Button;
		protected var _header : Header;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function ScreenBase()
		{
			super();
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
		 
		
		protected function createHeader(title:String):void
		{
			this._header = new Header();
			this._header.title = title;
			this.addChild(this._header);
			
		}
		
		protected function createButton(label:String):void
		{
			this._backBtn = new Button();
			this._backBtn.label = label;
			this._backBtn.addEventListener(Event.TRIGGERED, triggeredHandler);
		}
		
		protected function triggeredHandler(event:Event):void
		{
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}