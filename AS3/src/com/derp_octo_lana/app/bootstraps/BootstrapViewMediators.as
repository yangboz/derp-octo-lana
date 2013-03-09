
package com.derp_octo_lana.app.bootstraps
{
	import com.derp_octo_lana.app.views.MainView;
	import com.derp_octo_lana.app.views.MainViewMediator;
	import com.derp_octo_lana.app.views.SplashScreen;
	import com.derp_octo_lana.app.views.SplashScreenMediator;
	
	import org.robotlegs.core.IStarlingMediatorMap;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * BootstrapViewMediators.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 11:17:48 PM
	 * @history 05/00/12,
	 */ 
	public class BootstrapViewMediators
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		
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
		public function BootstrapViewMediators(mediatorMap:IStarlingMediatorMap)
		{
			mediatorMap.mapView(MainView,MainViewMediator);
			mediatorMap.mapView(SplashScreen,SplashScreenMediator);
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