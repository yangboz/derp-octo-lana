package com.derp_octo_lana.app.views {
	import starling.display.DisplayObject;
	import feathers.controls.Header;
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import starling.events.Event;
	import feathers.controls.Button;
	import feathers.controls.Screen;
	/**
	* SettingScreen.as
	* Created 2013-3-12 下午12:22:59
	* @author lee
	* @langVersion 3.0
	* @playerVersion 11.2+
	* @airVersion 3.2+
	* @history 05/00/12
	*/
	public class SettingScreen extends Screen{
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _back:Button;
		private var _header:Header;
		//--------------------------------------------------------------------------
		//
		// CONSTANTS
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Protected properties
		//
		// --------------------------------------------------------------------------
		override protected function initialize() : void {
			super.initialize();
			_back=new Button();
			_back.label="back";
			_back.addEventListener(Event.TRIGGERED, backhandler);
			
			this._header = new Header();
			this._header.title = "设置";
			this.addChild(this._header);
			this._header.rightItems = new <DisplayObject>
				[
					this._back
				];
		}
		override protected function draw() : void {
			super.draw();
			this._header.width = this.actualWidth;
//			this._header.validate();
//			_back.x=this.actualWidth-_back.width;
		}
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function SettingScreen() {
				
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
		
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function backhandler(event : Event) : void {
			event;
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
	}
}
