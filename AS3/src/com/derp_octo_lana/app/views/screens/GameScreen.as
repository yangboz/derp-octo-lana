
package com.derp_octo_lana.app.views.screens
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.derp_octo_lana.app.models.SET.SETsModel;
	import com.derp_octo_lana.app.views.screens.ScreenBase;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.ResizeEvent;
	
	
	/**
	 * GameScreen.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 12, 2013 12:22:12 PM
	 * @history 05/00/12,
	 */ 
	public class GameScreen extends ScreenBase
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		//
		private var _collection:ListCollection;
		private var _list:List;
		private var _pageIndicator:PageIndicator;
		private var _setButton:Button;
		private var _shuffleButton:Button;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(GameScreen);
		//
		private static const MAX_LEN_LABEL:int = 4;
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
		public function GameScreen()
		{
			super();
			//
			this.headerTitle = "SET-";
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		//
		public function updateTileList(setCards:ListCollection):void
		{
			this._collection = setCards;//Refresh the tabel tile-list.
			//relayout for view update.
			this._list.dataProvider = this._collection;
			this.layout();
		}
		//--------------------------------------------------------------------------
		//
		// Protected methods
		//
		//--------------------------------------------------------------------------
		//
		override protected function initialize():void
		{
			super.initialize();
			//
			this.stage.addEventListener(ResizeEvent.RESIZE, stage_resizeHandler);
			//
			this._collection = new ListCollection();
			const listLayout:TiledRowsLayout = new TiledRowsLayout();
			//			const listLayout:TiledColumnsLayout = new TiledColumnsLayout();
			listLayout.paging = TiledRowsLayout.PAGING_HORIZONTAL;
			listLayout.useSquareTiles = false;
			listLayout.tileVerticalAlign = TiledRowsLayout.TILE_VERTICAL_ALIGN_JUSTIFY;
			listLayout.tileHorizontalAlign = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
			listLayout.horizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			listLayout.verticalAlign = TiledRowsLayout.VERTICAL_ALIGN_MIDDLE;
			
			this._list = new List();
			this._list.allowMultipleSelection = true;
			this._list.dataProvider = this._collection;
			this._list.layout = listLayout;
			this._list.snapToPages = true;
			this._list.scrollBarDisplayMode = List.SCROLL_BAR_DISPLAY_MODE_NONE;
			this._list.horizontalScrollPolicy = List.SCROLL_POLICY_ON;
			this._list.itemRendererFactory = tileListItemRendererFactory;
			this._list.addEventListener(Event.SCROLL, list_scrollHandler);
			this._list.addEventListener(Event.CHANGE, list_changeHandler);
			this.addChild(this._list);
			//
			//			const normalSymbolTexture:Texture = this._iconAtlas.getTexture("normal-page-symbol");
			//			const selectedSymbolTexture:Texture = this._iconAtlas.getTexture("selected-page-symbol");
			this._pageIndicator = new PageIndicator();
			//			this._pageIndicator.normalSymbolFactory = function():Image
			//			{
			//				return new Image(normalSymbolTexture);
			//			}
			//			this._pageIndicator.selectedSymbolFactory = function():Image
			//			{
			//				return new Image(selectedSymbolTexture);
			//			}
			this._pageIndicator.direction = PageIndicator.DIRECTION_HORIZONTAL;
			this._pageIndicator.pageCount = 1;
			this._pageIndicator.gap = 3;
			this._pageIndicator.y = this._header.height;
			this._pageIndicator.paddingTop = this._pageIndicator.paddingRight = this._pageIndicator.paddingBottom =
				this._pageIndicator.paddingLeft = 6;
			this._pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			this.addChild(this._pageIndicator);
		}
		//
		override protected function draw():void
		{
			super.draw();
			//
			this.layout();
		}
		//
		override protected function getHeaderRightItems():Vector.<DisplayObject>
		{
			var items:Vector.<DisplayObject>  = new Vector.<DisplayObject>();
			this._shuffleButton = new Button();
			this._shuffleButton.label = "SHUFFLE";
			this._shuffleButton.isEnabled = true;//default value.
			this._shuffleButton.addEventListener(Event.TRIGGERED, shuffle_button_triggeredHandler);
			items.push(this._shuffleButton);
			this._setButton = new Button();
			this._setButton.label = "SET";
			this._setButton.isEnabled = false;//default value.
			this._setButton.addEventListener(Event.TRIGGERED, set_button_triggeredHandler);
			items.push(this._setButton);
			return items;
		}
		//
		protected function tileListItemRendererFactory():IListItemRenderer
		{
			const renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.labelField = "label";
			renderer.labelFunction = function(value:Object):String
			{
				var result:String=value.label;
				var len:int = MAX_LEN_LABEL;
				if (value.label.length > len)
				{
					result=value.label.substr(0, len-1).concat("..");//Detail string required.
				}else if (value.label.length < len)
				{
					result = result.concat(" ");//Append white space.
				}
				return result;
			};
			renderer.iconSourceField = "texture";
			//			renderer.iconPosition = Button.ICON_POSITION_TOP;
			renderer.iconPosition = Button.VERTICAL_ALIGN_TOP;
			//			renderer.accessoryField = "accessory";
			//			renderer.accessoryLabelField = "accessory";
			//			renderer.defaultLabelProperties.textFormat = new BitmapFontTextFormat(this._font, NaN, 0x000000);
			return renderer;
		}
		//
		protected function list_scrollHandler(event:Event):void
		{
			//			LOG.info("List scroll to index:{0}",this._list.horizontalPageIndex);
			this._pageIndicator.selectedIndex = this._list.horizontalPageIndex;
		}
		//
		protected function pageIndicator_changeHandler(event:Event):void
		{
			//			LOG.info("Page Indicator scroll to index:{0}",this._pageIndicator.selectedIndex);
			this._list.scrollToPageIndex(this._pageIndicator.selectedIndex, 0, 0.25);
		}
		//
		protected function stage_resizeHandler(event:ResizeEvent):void
		{
			this.layout();
		}
		//
		protected function layout():void
		{
			if(!this._pageIndicator) this._pageIndicator = new PageIndicator();
			this._pageIndicator.width = FlexGlobals.flashStage.stageWidth;
			this._pageIndicator.validate();
			this._pageIndicator.y = FlexGlobals.flashStage.stageHeight - this._pageIndicator.height;
			
			const shorterSide:Number = Math.min(FlexGlobals.flashStage.stageWidth, FlexGlobals.flashStage.stageHeight);
			const layout:TiledRowsLayout = TiledRowsLayout(this._list.layout);
			//			const layout:TiledColumnsLayout = TiledColumnsLayout(this._list.layout);
			layout.paddingTop = layout.paddingRight = layout.paddingBottom =
				layout.paddingLeft = shorterSide * 0.06;
			layout.gap = shorterSide * 0.04;
			
			this._list.itemRendererProperties.gap = shorterSide * 0.01;
			
			this._list.width = FlexGlobals.flashStage.stageWidth;
			this._list.y = this._header.height;
			this._list.height = this._pageIndicator.y;
			this._list.validate();
			
			this._pageIndicator.pageCount = Math.ceil(this._list.maxHorizontalScrollPosition / this._list.width) + 1;
		}
		//
		override protected function back_button_triggeredHandler(event:Event):void
		{
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		//Call out the table detail information.
		private function list_changeHandler(event:Event):void
		{
//			trace(this._list.selectedItem);
//			trace(this._list.selectedIndices);
			if(this._list.selectedIndices.length==SETsModel.MAX_PER_SETS)
			{
				this._setButton.isEnabled = this.validateSet();
			}else
			{
				this._setButton.isEnabled = false;
			}
		}
		//
		private function set_button_triggeredHandler(event:Event):void
		{
			//TODO:
		}
		//
		private function shuffle_button_triggeredHandler(event:Event):void
		{
			//
			var shuffled:ListCollection = SETsModel.getShuffledCurrentSetCards();
			LOG.info("shuffled set cards:{0}",shuffled);
			this.updateTileList(shuffled);
		}
		//
		private function validateSet():Boolean
		{
			//
			var setFacts:Array = [];
			for each(var item:Object in this._list.selectedItems)
			{
				LOG.info("item.SETfact:{0}",item.SETfact);
				setFacts.push(item.SETfact);
			}
			return SETsModel.validateSet(setFacts);
		}
	}
	
}