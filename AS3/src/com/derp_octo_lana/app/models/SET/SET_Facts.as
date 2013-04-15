
package com.derp_octo_lana.app.models.SET
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * SET_Facts.as class. the only argument it expects in the constructor is a SET_FactsBuilder instance:
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Apr 12, 2013 10:21:15 PM
	 * @history 05/00/12,
	 */ 
	public class SET_Facts
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _color:int;//@required
		private var _number:int;//@required
		private var _shading:int;//@required
		private var _symbol:int;//@required
		private var _builder:SET_FactsBuilder;//@optional
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
		public function SET_Facts(builder:SET_FactsBuilder)
		{
			this._builder = builder;
			this._color = builder.color;
			this._number = builder.number;
			this._shading = builder.shading;
			this._symbol = builder.symbol;
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function toString():String
		{
			return this._builder.toString();
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