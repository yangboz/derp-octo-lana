
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
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	
	/**
	 * HelpScreen.as class. 
	 * @author Administrator
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created 2013-3-12 下午2:34:47
	 * @history 05/00/12,
	 */ 
	public class HelpScreen extends Screen
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _backBtn : Button;
		private var _header : Header;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(HelpScreen);
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
		public function HelpScreen()
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
		override protected function initialize():void
		{
			this._backBtn = new Button();
			this._backBtn.label = 'BACK';
			this._backBtn.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			
			this._header = new Header();
			this._header.title = "Game Help";
			this.addChild(this._header);
			
			this._header.leftItems = new <starling.display.DisplayObject>
				[
					this._backBtn
				];
		}
		
		override protected function draw():void
		{
			this._header.width = this.actualWidth;
			this._header.validate();
		}
		
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function backButton_triggeredHandler(event:Event):void
		{
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
	}
	
}