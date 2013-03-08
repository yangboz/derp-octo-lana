
package com.derp_octo_lana.app.events
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.godpaper.as3.utils.LogUtil;
	
	import flash.events.Event;
	
	import mx.logging.ILogger;
	
	
	/**
	 * ExampleEvent.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 11:02:21 PM
	 * @history 05/00/12,
	 */ 
	public class MainEvent extends Event
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
		private static const LOG:ILogger = LogUtil.getLogger(MainEvent);
		//
		public static const HELLO:String = "hello";
		public static const GOODBYE:String = "goodbye";
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		public function get message():String
		{
			return _message;
		}
		
		public function set message(message:String):void
		{
			_message = message;
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
		public function MainEvent(type:String, message:String = "")
		{
			super(type);
			//
			this._message = message;
			//
			LOG.info("received msg:{0}",message);
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
	}
	
}