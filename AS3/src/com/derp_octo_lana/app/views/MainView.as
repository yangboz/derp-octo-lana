
package com.derp_octo_lana.app.views
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.context.MainStarlingViewContext;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import flash.utils.setTimeout;
	/**
	 * MainView.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 10:50:30 PM
	 * @history 05/00/12,
	 */ 
	public class MainView extends Sprite
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _starlingContext:StarlingContext;
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
		public function MainView()
		{
			super();
			//
			this._starlingContext = new MainStarlingViewContext(this);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
		private function onAddedToStage():void
		{
			//
			var subView:SubView = new SubView();
			this.addChild(subView);
			//Test mediator on remove,3 sec.
			setTimeout(subView.parent.removeChild,3000,subView);
		}
	}
	
}