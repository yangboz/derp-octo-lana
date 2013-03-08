
package com.derp_octo_lana.app.models
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.events.MainEvent;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * MainModel.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 11:06:16 PM
	 * @history 05/00/12,
	 */ 
	public class MainModel extends Actor
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _message:String;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(MainModel);
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		public function set message(value:String):void
		{
			this._message = value;
			//
			LOG.info("message set: {0}",value);
		}
		
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
		public function MainModel()
		{
			super();
			//
			this._message = "Default Main Model message";
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function requestEvent():void
		{
			var mainEvent:MainEvent = new MainEvent(MainEvent.HELLO);
			mainEvent.message = this._message;
			this.dispatch(mainEvent);
		}
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
	}
	
}