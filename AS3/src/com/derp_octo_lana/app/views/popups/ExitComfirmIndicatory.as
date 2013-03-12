package com.derp_octo_lana.app.views.popups
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	
	import feathers.controls.Button;
	import feathers.controls.ScrollContainer;
	import feathers.core.PopUpManager;
	
	import org.osflash.signals.Signal;
	
	import starling.events.Event;
	
	
	/**
	 * ExitComfirmIndicatory.as class.When playing game, the player wanna quit game,comfirm window on demanding.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 10, 2013 11:51:52 PM
	 * -----------------------------------</br>
	 * ------------Exit confirm-----------</br>
	 * -----------------------------------</br>
	 * -----------------------------------</br>
	 * --------Cancel-----Join Game-------</br>
	 * -----------------------------------</br>
	 */   	 
//	public class ExitComfirmIndicatory extends PanelScreen
	public class ExitComfirmIndicatory extends IndicatoryBase	
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _buttonsContainer:ScrollContainer;//submit,next button 
		private var _cancelBtn:Button;//camcel exiting game button.
		private var _exitBtn:Button;//confirm exit game button.
		//Public signals
		public var signal_exit_game:Signal;
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
		public function ExitComfirmIndicatory()
		{
			super();
			//
			this.signal_exit_game = new Signal();
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
			this._buttonsContainer = new ScrollContainer();
			this._buttonsContainer.layout = this.hLayout;
			this._container.addChild(this._buttonsContainer);
			//buttons 
			this._cancelBtn = new Button();
			this._cancelBtn.label = "Cancel";
			this._buttonsContainer.addChild(this._cancelBtn);
			this._exitBtn = new Button();
			this._exitBtn.label = "Exit";
			this._buttonsContainer.addChild(this._exitBtn);
			//event listener
			//			this._submitBtn.onRelease.add(submitButtonOnRelease);
			this._cancelBtn.addEventListener(starling.events.Event.TRIGGERED,cancelButtonOnRelease);
			//			this._nextBtn.onRelease.add(nextButtonOnRelease);
			this._exitBtn.addEventListener(starling.events.Event.TRIGGERED,exitButtonOnRelease);
			//
			this._header.title = "Confirm exit?";
			this.width = 400;
			this.height = 200;
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
		private function exitButtonOnRelease(event:Event):void
		{
			//Remove the pop-up.
			PopUpManager.removePopUp(this);
			//Screen swither here.
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
			//Signal broad casting
			this.signal_exit_game.dispatch();
		}
	}
	
}