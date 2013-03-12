package com.derp_octo_lana.app.views.popups
{
	import com.derp_octo_lana.app.consts.FlexGlobals;
	
	import mx.utils.UIDUtil;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.TextInput;
	import feathers.core.PopUpManager;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * EnterUpIndicatory.as class.To register player's name before enter up to lobby screen.</br>
	 * Example skelton as follows:</br>	
	 * -----------------------------------</br>
	 * --------What's your name?----------</br>
	 * -----------------------------------</br>
	 * -----------------------------------</br>
	 * ------------TextInput--------------</br>
	 * -----------------------------------</br>
	 * -----------------------------------</br>
	 * --------Cancel-----Join Game-------</br>
	 * -----------------------------------</br>
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 3, 2013 3:31:00 PM
	 */   	 
	public class EnterUpIndicatory extends IndicatoryBase
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _nameInput:TextInput;
		private var _inputsContainer:ScrollContainer;
		private var _buttonsContainer:ScrollContainer;//submit,next button 
		private var _joinBtn:Button;//join gamebutton.
		private var _cancelBtn:Button;//camcel enter up game button.
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function EnterUpIndicatory()
		{
			super();
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		override protected function initialize():void
		{
			super.initialize();
			//_buttonsContainer
			this._inputsContainer = new ScrollContainer();
			this._inputsContainer.layout = this.vLayout;
			this._container.addChild(this._inputsContainer);
			this._buttonsContainer = new ScrollContainer();
			this._buttonsContainer.layout = this.hLayout;
			this._container.addChild(this._buttonsContainer);
			//text inputs
			this._nameInput = new TextInput();
			this._nameInput.height = 25;
			this._inputsContainer.addChild(this._nameInput);
			//Default name 
			this._nameInput.text = UIDUtil.createUID().substr(0,8);
			//buttons 
			this._cancelBtn = new Button();
			this._cancelBtn.label = "Cancel";
			this._buttonsContainer.addChild(this._cancelBtn);
			this._joinBtn = new Button();
			this._joinBtn.label = "Enter";
			this._buttonsContainer.addChild(this._joinBtn);
			//event listener
			//			this._submitBtn.onRelease.add(submitButtonOnRelease);
			this._joinBtn.addEventListener(starling.events.Event.TRIGGERED,joinButtonOnRelease);
			this._cancelBtn.addEventListener(starling.events.Event.TRIGGERED,cancelButtonOnRelease);
			//
			this._header.title = "What's your name?";
			this.width = 400;
			this.height = 360;
		}
		//
		override protected function draw():void
		{
			super.draw();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		//
		private function joinButtonOnRelease(event:Event):void
		{
			if(this._nameInput.text.length<=0)//name text input validate.
			{
				const content:Label = new Label();
				content.text = "Please input your name!";
				Callout.show(DisplayObject(content), this._nameInput, Callout.DIRECTION_LEFT);
				return;
			}
			//Register player role name
			var peerID:String = UIDUtil.createUID();
			FlexGlobals.userModel.addUser(peerID);
			FlexGlobals.userModel.hostRoleName = this._nameInput.text;
			FlexGlobals.userModel.registerRole(peerID,1,FlexGlobals.userModel.ROLE_NAME_LIST[1]);
			//Enter up to game server by plugin initialization.
			FlexGlobals.playerIoPlugin.initialization();
		}
		//
		private function cancelButtonOnRelease(event:Event):void
		{
			PopUpManager.removePopUp(this);
			//Go back to main menu screen
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
	}
	
}