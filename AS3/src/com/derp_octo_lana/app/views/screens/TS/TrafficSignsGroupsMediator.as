
package com.derp_octo_lana.app.views.screens.TS
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.models.TS.TrafficSignsModel;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.data.HierarchicalCollection;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	
	/**
	 * TrafficSignsGroupsMediator.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 14, 2013 10:23:42 AM
	 * @history 05/00/12,
	 */ 
	public class TrafficSignsGroupsMediator extends StarlingMediator
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		[Inject]
		public var traffic_signs_model:TrafficSignsModel;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(TrafficSignsGroupsMediator);
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
		public function TrafficSignsGroupsMediator()
		{
			super();
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		override public function onRegister():void
		{
			LOG.info("onRegister");
			//
			this.viewComponent._gList.dataProvider = new HierarchicalCollection(traffic_signs_model.traffic_signs_groups);
		}
		//
		override public function onRemove():void
		{
			LOG.info("onRemove");
			//
			
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