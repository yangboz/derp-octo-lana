package com.derp_octo_lana.app.views {
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.Header;
	import feathers.controls.Screen;
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
	public class MainMenuScreen extends Screen
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _header:Header;
		private var _backButton:Button;
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
			this._buttonGroup = new ButtonGroup();
			this._buttonGroup.dataProvider = new ListCollection(
				[
					{ label: "Play", triggered: play_button_triggeredHandler },
					{ label: "Help", triggered: button_triggeredHandler },
					{ label: "Credits", triggered: button_triggeredHandler },
					{ label: "About", triggered: button_triggeredHandler },
				]);
			this.addChild(this._buttonGroup);
			
			this._backButton = new Button();
			this._backButton.label = "Setting";
			this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			
			this._header = new Header();
			this._header.title = "Main Menu";
			this.addChild(this._header);
			this._header.rightItems = new <DisplayObject>
				[
					this._backButton
				];
			
			// handles the back hardware key on android
			this.backButtonHandler = this.onBackButton;
		}
		
		override protected function draw():void
		{
			this._header.width = this.actualWidth;
			this._header.validate();
			
			this._buttonGroup.validate();
			this._buttonGroup.x = (this.actualWidth - this._buttonGroup.width) / 2;
			this._buttonGroup.y = this._header.height + (this.actualHeight - this._header.height - this._buttonGroup.height) / 2;
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function onBackButton():void
		{
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_SETTINGS);
//			this.dispatchEventWith(Event.COMPLETE);
		}
		
		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
		
		private function button_triggeredHandler(event:Event):void
		{
			const button:Button = Button(event.currentTarget);
			//trace(button.label + " triggered.");
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_HELP);
		}
		//
		private function play_button_triggeredHandler(event:Event):void
		{
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_GAME);
		}
	}
	
}