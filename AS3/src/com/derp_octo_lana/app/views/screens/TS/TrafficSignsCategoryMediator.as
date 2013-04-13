package com.derp_octo_lana.app.views.screens.TS
{
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.derp_octo_lana.app.models.TrafficSignsModel;
	
	import org.robotlegs.mvcs.StarlingMediator;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TrafficSignsCategoryMediator.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 14, 2013 6:37:52 PM
	 * @history 05/00/12,
	 */ 
	public class TrafficSignsCategoryMediator extends StarlingMediator
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		//Model
		[Inject]
		public var traffic_signs_model:TrafficSignsModel;
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
		public function TrafficSignsCategoryMediator()
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
		override public function onRegister():void
		{
			this.viewComponent.updateTileList( traffic_signs_model.getAssembledCategories(FlexGlobals.selectedTSgroup) );
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}