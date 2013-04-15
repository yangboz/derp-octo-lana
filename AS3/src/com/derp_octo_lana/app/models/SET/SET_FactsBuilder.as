
package com.derp_octo_lana.app.models.SET
{
	import com.derp_octo_lana.app.consts.COLORs;
	import com.derp_octo_lana.app.consts.SHADINGs;
	import com.derp_octo_lana.app.consts.SYMBOLs;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * SET_FactsBuilder.as class. this is based upon the Builder pattern and make use of a fluent interface:
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Apr 12, 2013 10:23:32 PM
	 * @history 05/00/12,
	 */ 
	public class SET_FactsBuilder
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		internal var color:uint;
		internal var number:int;
		internal var shading:uint;
		internal var symbol:uint;
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
		public function SET_FactsBuilder(color:int=1,number:int=1,shading:int=1,symbol:int=1)
		{
			this.color = color;
			this.number = number;
			this.shading = shading;
			this.symbol = symbol;
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		//builder with color feature
		public function withColor(value:int):SET_FactsBuilder
		{
			this.color = value;
			return this;
		}
		//builder with number number
		public function withNumber(value:int):SET_FactsBuilder
		{
			this.number = value;
			return this;
		}
		//builder with color shading
		public function withShading(value:int):SET_FactsBuilder
		{
			this.shading = value;
			return this;
		}
		//builder with color symbol
		public function withSymbol(value:int):SET_FactsBuilder
		{
			this.symbol = value;
			return this;
		}
		
		//builder
		public function build():SET_Facts
		{
			return new SET_Facts(this);
		}
		
		//
		public function toString():String
		{
			var result:String = "";
			result = result.concat(this.getColorString(color),"_",this.getSymbolString(symbol),"_",this.number,"_",this.getShadingString(shading));
			return result;
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
		//color
		private function getColorString(color:int):String
		{
			if(color==COLORs.BLUE) return "BLUE";
			if(color==COLORs.RED) return "RED";
			if(color==COLORs.GREEN) return "GREEN";
			return null;
		}
		//symbol
		private function getSymbolString(symbol:int):String
		{
			if(symbol==SYMBOLs.DIAMONDS) return "DIAMONDS";
			if(symbol==SYMBOLs.OVALS) return "OVALS";
			if(symbol==SYMBOLs.SQUIGGLES) return "SQUIGGLES";
			return null;
		}
		//shading
		private function getShadingString(shading:int):String
		{
			if(shading==SHADINGs.OPEN) return "OPEN";
			if(shading==SHADINGs.SOLID) return "SOLID";
			if(shading==SHADINGs.STRIPED) return "STRIPED";
			return null;
		}
	}
	
}