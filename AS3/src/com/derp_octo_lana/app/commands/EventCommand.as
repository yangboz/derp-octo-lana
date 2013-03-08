
package com.derp_octo_lana.app.commands
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.events.MainEvent;
	import com.derp_octo_lana.app.models.MainModel;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	
	/**
	 * EventCommand.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 11:13:35 PM
	 * @history 05/00/12,
	 */ 
	public class EventCommand extends StarlingCommand
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var mainModel:MainModel;
		
		[Inject]
		public var mainEvent:MainEvent;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(EventCommand);
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
		public function EventCommand()
		{
			super();
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function execute():void
		{
			LOG.info("execute()");
			//
			var newMessage:String = mainEvent.message;
			mainModel.message = newMessage;
			mainModel.requestEvent();
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