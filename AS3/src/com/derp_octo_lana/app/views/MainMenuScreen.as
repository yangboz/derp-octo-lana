package com.derp_octo_lana.app.views {
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;

	import starling.display.DisplayObject;
	import starling.events.Event;

	import com.derp_octo_lana.app.consts.FlexGlobals;
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	// --------------------------------------------------------------------------
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	// --------------------------------------------------------------------------
	
	[Event(name="complete",type="starling.events.Event")]
	/**
	 * MainMenuScreen.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 9, 2013 5:34:37 PM
	 * @history 05/00/12,
	 */ 
	public class MainMenuScreen extends ScreenBase
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _settingBtn:Button;
		private var _buttonGroup:ButtonGroup;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		
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
		public function MainMenuScreen()
		{
			super();
			this.headerTitle = "Main Menu";
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
			super.initialize();
			this._buttonGroup = new ButtonGroup();
			this._buttonGroup.dataProvider = new ListCollection(
				[
					{ label: "Play", triggered: play_button_triggeredHandler },
					{ label: "Help", triggered: button_triggeredHandler },
					{ label: "Credits", triggered: button_triggeredHandler },
					{ label: "About", triggered: button_triggeredHandler },
				]);
			this.addChild(this._buttonGroup);
			// handles the back hardware key on android
		}

		override protected function getHeaderRightItems() : Vector.<DisplayObject> {
			var items:Vector.<DisplayObject>=new Vector.<DisplayObject>();
			this._settingBtn = new Button();
			this._settingBtn.label = "Setting";
			this._settingBtn.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			items.push(_settingBtn);
			return items;
		}

		override protected function getHeaderLeftItems() : Vector.<DisplayObject> {
			return new Vector.<DisplayObject>();
		}
		
		override protected function draw():void
		{
			super.draw();
			this._buttonGroup.validate();
			this._buttonGroup.x = (this.actualWidth - this._buttonGroup.width) / 2;
			this._buttonGroup.y = this._header.height + (this.actualHeight - this._header.height - this._buttonGroup.height) / 2;
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function backButton_triggeredHandler(event:Event):void
		{
			event;
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_SETTINGS);
		}
		
		private function button_triggeredHandler(event:Event):void
		{
			const button:Button = Button(event.currentTarget);
			button.label;
			//trace(button.label + " triggered.");
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_HELP);
		}
		//
		private function play_button_triggeredHandler(event:Event):void
		{
			event;
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_LOOBY);
		}
	}
	
}