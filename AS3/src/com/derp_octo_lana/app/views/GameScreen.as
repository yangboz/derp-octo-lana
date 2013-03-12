
package com.derp_octo_lana.app.views
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Screen;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	
	/**
	 * GameScreen.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 12, 2013 12:22:12 PM
	 * @history 05/00/12,
	 */ 
	public class GameScreen extends Screen
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _header:Header;
		private var _backButton:Button;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(GameScreen);
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
		public function GameScreen()
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
			this._backButton = new Button();
			this._backButton.label = "BACK";
			this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			
			this._header = new Header();
			this._header.title = "Game Screen";
			this.addChild(this._header);
			this._header.leftItems = new <DisplayObject>
				[
					this._backButton
				];
			
		}
		//
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