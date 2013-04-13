package com.derp_octo_lana.app.views.screens.TS
{
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.controls.GroupedList;
	import feathers.layout.AnchorLayoutData;
	import feathers.skins.StandardIcons;
	
	import starling.events.Event;
	import starling.textures.Texture;
	import com.derp_octo_lana.app.views.screens.ScreenBase;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TrafficSignsGroupsScreen.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 14, 2013 10:21:45 AM
	 * @history 05/00/12,
	 */ 
	public class TrafficSignsGroupsScreen extends ScreenBase
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		public var _gList:GroupedList;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(TrafficSignsGroupsScreen);
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
		public function TrafficSignsGroupsScreen()
		{
			super();
			//
			this.headerTitle = "交通标识大全";
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
		override protected function initialize():void
		{
			super.initialize();
			//
			this._gList = new GroupedList();
//			this._gList.dataProvider = new HierarchicalCollection(traffic_signs_model.traffic_signs_groups);
			this._gList.typicalItem = { text: "Item 1000" };
			this._gList.typicalHeader = "Group 10";
			this._gList.typicalFooter = "Footer 10";
			this._gList.isSelectable = true;
//			this._gList.hasElasticEdges = this.settings.hasElasticEdges;
			this._gList.itemRendererProperties.labelField = "text";
			this._gList.addEventListener(Event.CHANGE, list_changeHandler);
			this._gList.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this._gList.itemRendererProperties.accessorySourceFunction = accessorySourceFunction;
			this.addChildAt(this._gList, 0);
		}
		//
		override protected function draw():void
		{
			super.draw();
			//
			this._gList.y = this._header.height;
			this._gList.width = this.actualWidth;
			this._gList.height = this.actualHeight - this._gList.y;
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function list_changeHandler(event:Event):void
		{
			LOG.info("GroupedList onChange:{0},{1},{2}", this._gList.selectedGroupIndex, this._gList.selectedItemIndex, this._gList.selectedItem.text);
			//
			FlexGlobals.selectedTSgroup = this._gList.selectedItem.text;
			//
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_TRAFFIC_SIGNS_CATEGORY);
		}
		//
		private function accessorySourceFunction(item:Object):Texture
		{
			if(item.hasOwnProperty("enabled")&&item.enabled==true)
			{
				return StandardIcons.listDrillDownAccessoryTexture;
			}
			return null;
		}
	}
	
}