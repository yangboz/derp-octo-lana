package com.derp_octo_lana.app.views.screens {
	import flash.display.StageDisplayState;
	import feathers.controls.Check;
	import com.derp_octo_lana.app.consts.FlexGlobals;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Screen;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	/**
	* SettingScreen.as
	* Created 2013-3-12 下午12:22:59
	* @author lee
	* @langVersion 3.0
	* @playerVersion 11.2+
	* @airVersion 3.2+
	* @history 05/00/12
	*/
	public class SettingScreen extends ScreenBase
	{
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _fullBtn:Check;
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
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function SettingScreen() 
		{
			super();
			this.headerTitle = "设置";
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
		// --------------------------------------------------------------------------
		override protected function initialize() : void {
			return super.initialize();
			_fullBtn=new Check();
			_fullBtn.label="全屏";
			_fullBtn.x=50;
			addChild(_fullBtn);
			_fullBtn.addEventListener(Event.TRIGGERED, fullHandler);
		}

		

		override protected function draw() : void {
			super.draw();
//			_fullBtn.y=_header.height+50;
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function fullHandler(event : Event) : void {
			event;
			var nowstate:String=FlexGlobals.flashStage.displayState;
			if(nowstate==StageDisplayState.NORMAL){
				FlexGlobals.flashStage.displayState=StageDisplayState.FULL_SCREEN;
			}else{
				FlexGlobals.flashStage.displayState=StageDisplayState.NORMAL;
			}
		}
	}
}
