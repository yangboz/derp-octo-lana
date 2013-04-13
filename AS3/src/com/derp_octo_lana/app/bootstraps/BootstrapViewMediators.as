
package com.derp_octo_lana.app.bootstraps
{
	import com.derp_octo_lana.app.views.MainView;
	import com.derp_octo_lana.app.views.MainViewMediator;
	import com.derp_octo_lana.app.views.screens.GameScreen;
	import com.derp_octo_lana.app.views.screens.GameScreenMediator;
	import com.derp_octo_lana.app.views.screens.HelpScreen;
	import com.derp_octo_lana.app.views.screens.HelpScreenMediator;
	import com.derp_octo_lana.app.views.screens.LobbyScreen;
	import com.derp_octo_lana.app.views.screens.LobbyScreenMediator;
	import com.derp_octo_lana.app.views.screens.SplashScreen;
	import com.derp_octo_lana.app.views.screens.SplashScreenMediator;
	import com.derp_octo_lana.app.views.screens.TS.TrafficSignsCategoryMediator;
	import com.derp_octo_lana.app.views.screens.TS.TrafficSignsCategoryScreen;
	import com.derp_octo_lana.app.views.screens.TS.TrafficSignsGroupsMediator;
	import com.derp_octo_lana.app.views.screens.TS.TrafficSignsGroupsScreen;
	
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
			mediatorMap.mapView(GameScreen,GameScreenMediator);
			mediatorMap.mapView(LobbyScreen,LobbyScreenMediator);
			mediatorMap.mapView(HelpScreen,HelpScreenMediator);
			mediatorMap.mapView(TrafficSignsGroupsScreen,TrafficSignsGroupsMediator);
			mediatorMap.mapView(TrafficSignsCategoryScreen,TrafficSignsCategoryMediator);
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