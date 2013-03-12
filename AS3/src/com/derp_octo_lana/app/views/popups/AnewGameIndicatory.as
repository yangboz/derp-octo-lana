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
	
	import org.osflash.signals.Signal;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * AnewGameIndicatory.as class.Create a new game by hoster.</br>
	 * Example skelton as follows:</br>	
	 * -----------------------------------</br>
	 * ----------Create new game----------</br>
	 * -----------------------------------</br>
	 * -----------------------------------</br>
	 * ------------TextInput--------------</br>
	 * -----------------------------------</br>
	 * -----------------------------------</br>
	 * -------CANCEL---------CREATE-------</br>
	 * -----------------------------------</br>
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 3, 2013 5:11:32 PM
	 */   	 
	public class AnewGameIndicatory extends IndicatoryBase
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _nameInput:TextInput;
		private var _inputsContainer:ScrollContainer;
		private var _buttonsContainer:ScrollContainer;//submit,next button 
		private var _cancelBtn:Button;//camcel creating game button.
		private var _createBtn:Button;//create a new game button.
		//Public signals
		public var signal_create_game:Signal;
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
		public function AnewGameIndicatory()
		{
			super();
			//
			this.signal_create_game = new Signal();
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
//			this._nameInput.height = 25;
//			this._nameInput.width = 125;
//			this._nameInput.text = "Amazing Game-".concat(UIDUtil.createUID().substr(0,4));
			this._inputsContainer.addChild(this._nameInput);
			//buttons 
			this._cancelBtn = new Button();
			this._cancelBtn.label = "Cancel";
			this._buttonsContainer.addChild(this._cancelBtn);
			this._createBtn = new Button();
			this._createBtn.label = "Create";
			this._buttonsContainer.addChild(this._createBtn);
			//event listener
			//			this._submitBtn.onRelease.add(submitButtonOnRelease);
			this._cancelBtn.addEventListener(starling.events.Event.TRIGGERED,cancelButtonOnRelease);
			//			this._nextBtn.onRelease.add(nextButtonOnRelease);
			this._createBtn.addEventListener(starling.events.Event.TRIGGERED,createButtonOnRelease);
			//
			this._header.title = "Create new game";
			this.width = 400;
			this.height = 400;
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
		private function cancelButtonOnRelease(event:Event):void
		{
			PopUpManager.removePopUp(this);
		}
		//
		private function createButtonOnRelease(event:Event):void
		{
			if(this._nameInput.text.length<=0)//name text input validate.
			{
				const content:Label = new Label();
				content.text = "Please input game name!";
				Callout.show(DisplayObject(content), this._nameInput, Callout.DIRECTION_UP);
				return;
			}
			//Set up a new game room here.
			if( FlexGlobals.playerIoPlugin )
			{
				FlexGlobals.playerIoPlugin.createRoom(this._nameInput.text,FlexGlobals.userModel.hosterPeerId,FlexGlobals.userModel.hosterRoleIndex);
			}
			//Remove the pop-up.
			PopUpManager.removePopUp(this);
			//Broad cast the creating game room signal.
			this.signal_create_game.dispatch();
		}
	}
	
}