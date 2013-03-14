
package com.derp_octo_lana.app.views.screens
{
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.controls.GroupedList;
	import feathers.data.HierarchicalCollection;
	
	import starling.events.Event;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TrafficSignsScreen.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 14, 2013 10:21:45 AM
	 * @history 05/00/12,
	 */ 
	public class TrafficSignsScreen extends ScreenBase
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _gList:GroupedList;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(TrafficSignsScreen);
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
		public function TrafficSignsScreen()
		{
			super();
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
			var groups:Array =
				[
					{
						header: "道路交通标志",
						children:
						[
							{ text: "1、警告标志" },
							{ text: "2、禁令标志" },
							{ text: "3、指示标志" },
							{ text: "4、指路标志" },
							{ text: "5、旅游区标志" },
							{ text: "6、道路施工安全标志" },
							{ text: "7、辅助标志" }
						]
					},
					{
						header: "道路交通标线",
						children:
						[
							{ text: "8、禁止标线" },
							{ text: "9、指示标线" },
							{ text: "10、警告标线" },
						]
					}
				];
			//
			this._gList = new GroupedList();
			this._gList.dataProvider = new HierarchicalCollection(groups);
			this._gList.typicalItem = { text: "Item 1000" };
			this._gList.typicalHeader = "Group 10";
			this._gList.typicalFooter = "Footer 10";
//			this._gList.isSelectable = this.settings.isSelectable;
//			this._gList.hasElasticEdges = this.settings.hasElasticEdges;
			this._gList.itemRendererProperties.labelField = "text";
			this._gList.addEventListener(Event.CHANGE, list_changeHandler);
//			this._gList.layoutData = new AnchorLayoutData(0, 0, 0, 0);
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
			trace("GroupedList onChange:", this._gList.selectedGroupIndex, this._gList.selectedItemIndex);
		}
	}
	
}