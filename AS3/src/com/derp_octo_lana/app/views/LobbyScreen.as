package com.derp_octo_lana.app.views
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.derp_octo_lana.app.views.popups.AnewGameIndicatory;
	import com.derp_octo_lana.app.views.popups.EnterUpIndicatory;
	import com.derp_octo_lana.app.views.popups.ThinkIndicatory;
	import com.godpaper.as3.utils.LogUtil;
	
	import mx.logging.ILogger;
	
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PageIndicator;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.PopUpManager;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	
	import playerio.RoomInfo;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.ResizeEvent;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**
	 * LobbyScreen.as class. All players should waited for others in the game lobby at first. 	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Feb 3, 2013 11:48:45 AM
	 */   	 
	public class LobbyScreen extends ScreenBase
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		private var _iconAtlas:TextureAtlas;
		private var _font:BitmapFont;
		private var _list:List;
		private var _pageIndicator:PageIndicator;
		//private var _header:Header;
		//
		private var _button_back:Button;
		private var _button_create:Button;
		private var _button_refresh:Button;
		private var _button_join:Button;
		//
		private var enterUpIndicatory:EnterUpIndicatory;
		private var anewGameIndicatory:AnewGameIndicatory;
		//Data provider
		private var collection:ListCollection = new ListCollection([]);
		//Indicatory
		private var connectingIndicatory:ThinkIndicatory;
		private var creatingIndicatory:ThinkIndicatory;
		private var joinIndicator:ThinkIndicatory;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(LobbyScreen);
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//-------------------------------------------------------------------------- 
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function LobbyScreen()
		{
			super();
			//
//			this._iconAtlas = AssetEmbedsDefault.getTextureAtlas();
			//
			this.connectingIndicatory = new ThinkIndicatory("Connecting...");
			this.creatingIndicatory = new ThinkIndicatory("Creating...");
		}     	
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		protected function layout():void
		{
			this._pageIndicator.width = this.stage.stageWidth;
			this._pageIndicator.validate();
			this._pageIndicator.y = this.stage.stageHeight - this._pageIndicator.height;
			
			const shorterSide:Number = Math.min(this.stage.stageWidth, this.stage.stageHeight);
			const layout:TiledRowsLayout = TiledRowsLayout(this._list.layout);
			layout.paddingTop = layout.paddingRight = layout.paddingBottom =
				layout.paddingLeft = shorterSide * 0.06;
			layout.gap = shorterSide * 0.04;
			
			this._list.itemRendererProperties.gap = shorterSide * 0.01;
			
			this._list.width = this.stage.stageWidth;
			this._list.height = this._pageIndicator.y;
			this._list.validate();
			
			this._pageIndicator.pageCount = Math.ceil(this._list.maxHorizontalScrollPosition / this._list.width) + 1;
		}
		//
		override protected function initialize():void
		{
			this.stage.addEventListener(ResizeEvent.RESIZE, stage_resizeHandler);
			
			const collection:ListCollection = new ListCollection(
				[
//					{ label: "Facebook", texture: this._iconAtlas.getTexture("TABLE") }
				]);
			
			const listLayout:TiledRowsLayout = new TiledRowsLayout();
			listLayout.paging = TiledRowsLayout.PAGING_HORIZONTAL;
			listLayout.useSquareTiles = false;
			listLayout.tileHorizontalAlign = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
			listLayout.horizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			
			this._list = new List();
			this._list.dataProvider = collection;
			this._list.layout = listLayout;
//			this._list.snapToPages = true;
//			this._list.scrollBarDisplayMode = List.SCROLL_BAR_DISPLAY_MODE_NONE;
//			this._list.horizontalScrollPolicy = List.SCROLL_POLICY_ON;
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
			this._pageIndicator.paddingTop = this._pageIndicator.paddingRight = this._pageIndicator.paddingBottom =
				this._pageIndicator.paddingLeft = 6;
			this._pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			this.addChild(this._pageIndicator);
			//Header view.
			//
			this._button_create = new Button();
						this._button_create.label = "ANEW GAME";//TODO:localization here.
//			this._button_done.label = this.resourceManager.getString(this.bundleName,"BTN_DONE");
			//			this._button_done.onRelease.add(doneButton_onRelease);
			this._button_create.addEventListener(starling.events.Event.TRIGGERED,createButton_onRelease);
			//
			this._button_back = new Button();
			//			this._button_back.label = "BACK";
			this._button_back.label = "BACK";
			//			this._button_back.onRelease.add(backButton_onRelease);
			this._button_back.addEventListener(starling.events.Event.TRIGGERED,backButton_onRelease);
			//
			this._button_refresh = new Button();
			this._button_refresh.label = "REFRESH";
//			this._button_refresh.label = this.resourceManager.getString(this.bundleName,"BTN_BACK");
			//			this._button_back.onRelease.add(backButton_onRelease);
			this._button_refresh.addEventListener(starling.events.Event.TRIGGERED,refreshButton_onRelease);
			//
			this._button_join = new Button();
			this._button_join.label = "JOIN";
			//			this._button_refresh.label = this.resourceManager.getString(this.bundleName,"BTN_BACK");
			//			this._button_back.onRelease.add(backButton_onRelease);
			this._button_join.addEventListener(starling.events.Event.TRIGGERED,joinButton_onRelease);
			//
			this._header = new Header();
			this._header.title = "Welcome to game lobby!";//TODO:localization here.
			if(FlexGlobals.userModel.hosterPeerId)
			{
				this._header.title = FlexGlobals.userModel.getUserRoleName(FlexGlobals.userModel.hosterPeerId) +", Welcome!";
			}
//			this._header.title = this.resourceManager.getString(this.bundleName,"HEADER_SETTINGS");
			this.addChild(this._header);
			this._header.rightItems = new <DisplayObject>
				[
					this._button_join,
					this._button_create
				];	
			this._header.leftItems = new <DisplayObject>
				[
					this._button_back,
					this._button_refresh
				];
			//
			this.layout();
			//Enterup overlay is neccessary.
			if(!FlexGlobals.userModel.hosterPeerId)
			{
				this.enterUpIndicatory = new EnterUpIndicatory();
				PopUpManager.addPopUp(enterUpIndicatory,true,true);
				PopUpManager.centerPopUp(enterUpIndicatory);
				//Signal_registed for removing pop-up
				FlexGlobals.userModel.signal_player_registed.addOnce(onPlayerRegisted);
			}
		}
		//
		protected function tileListItemRendererFactory():IListItemRenderer
		{
			const renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
			renderer.labelField = "label";
			renderer.iconSourceField = "texture";
			renderer.iconPosition = Button.ICON_POSITION_TOP;
//			renderer.accessoryField = "accessory";
//			renderer.accessoryLabelField = "accessory";
//			renderer.defaultLabelProperties.textFormat = new BitmapFontTextFormat(this._font, NaN, 0x000000);
			return renderer;
		}
		//
		protected function list_scrollHandler(event:Event):void
		{
			this._pageIndicator.selectedIndex = this._list.horizontalPageIndex;
		}
		//
		protected function pageIndicator_changeHandler(event:Event):void
		{
			this._list.scrollToPageIndex(this._pageIndicator.selectedIndex, 0, 0.25);
		}
		//
		protected function stage_resizeHandler(event:ResizeEvent):void
		{
			this.layout();
		}
		//
		override protected function draw():void
		{
			this._header.width = this.actualWidth;
			this._header.validate();
		}
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		private function createButton_onRelease(event:Event):void
		{
			//Pop up the creating game indicatory.
			this.anewGameIndicatory = new AnewGameIndicatory();
			this.anewGameIndicatory.signal_create_game.addOnce(onGameCreating);
			//
			PopUpManager.addPopUp(anewGameIndicatory,true,true);
			PopUpManager.centerPopUp(anewGameIndicatory);
			//Signal handler.
			if( FlexGlobals.playerIoPlugin )
			{
				//Signal addOnce
				FlexGlobals.playerIoPlugin.signal_user_joined.addOnce(onUserJoined);
			}
		}
		private function backButton_onRelease(event:Event):void
		{
			//Screen swither here.
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_MAIN_MENU);
		}
		//
		private function refreshButton_onRelease(event:Event):void
		{
			if( FlexGlobals.playerIoPlugin )
			{
				FlexGlobals.playerIoPlugin.refreshRoomList();
				//Signal addOnce
				FlexGlobals.playerIoPlugin.signal_room_refreshed.addOnce(onRoomsRefreshed);
			}
		}
		//
		private function joinButton_onRelease(event:Event):void
		{
			
			if(!this._list.selectedItem)
			{
				const content:Label = new Label();
				content.text = "Please select a game!";
				Callout.show(DisplayObject(content), this._button_join, Callout.DIRECTION_DOWN);
				return;
			}
			var roomID:String = this._list.selectedItem.roomID;
			var numOfPlayers:int = this._list.selectedItem.players;
			//Default Player1
			if(numOfPlayers>=1)
			{
				FlexGlobals.userModel.hosterRoleIndex = 1;//Player2
			}
			if(numOfPlayers>=2)
			{
				FlexGlobals.userModel.hosterRoleIndex = 2;//Spectator
			}
			if( FlexGlobals.playerIoPlugin )
			{
				//join selected game
				FlexGlobals.playerIoPlugin.joinRoom(roomID,FlexGlobals.userModel.hosterPeerId,FlexGlobals.userModel.hosterRoleIndex);
				//Signal handler.
				FlexGlobals.playerIoPlugin.signal_user_joined.addOnce(onUserJoined);
				//Joinning indicator pop up 
				this.joinIndicator = new ThinkIndicatory("Joining...");
				PopUpManager.addPopUp(joinIndicator);
				PopUpManager.centerPopUp(joinIndicator);
			}
		}
		//Signal handlers here.
		//
		private function onPlayerRegisted(peerID:String):void
		{
			PopUpManager.removePopUp(this.enterUpIndicatory);
			//Pop-up connnecting overlay
			PopUpManager.addPopUp(this.connectingIndicatory);
			PopUpManager.centerPopUp(this.connectingIndicatory);
			//Signal addOnce
			if( FlexGlobals.playerIoPlugin )
			{
				//Signal addOnce
				FlexGlobals.playerIoPlugin.signal_hoster_joined.addOnce(onHosterJoined);
			}
		}
		//
		private function onRoomsRefreshed(rooms:Array):void
		{
//			{ label: "Orkut", texture: this._iconAtlas.getTexture("TABLE") },
//			[playerio.RoomInfo]
//			id:				dWfBs_ef50uuqH97J0M4Pw
//			roomType:		TicTacToe
//			onlineUsers:	2
//			initData:		Id						Value
//			-------------------------------------------
//				name					My Amazing game!
//					
//			serverType is deprecated, please use roomType.
//			initData is deprecated, please use data.
			var roomArrary:Array = [];	
			for each(var room:RoomInfo in rooms)
			{
				LOG.debug(room.toString());
//				var label:String = room.data.name +","+room.onlineUsers.toString() + " players";
				var label:String = room.data.name;
				roomArrary.push( { label: label, texture: this._iconAtlas.getTexture("TABLE"), roomID:room.id, players:room.onlineUsers } );
//				roomArrary.push( { label: label, texture: this._iconAtlas.getTexture("TABLE"), accessory:">" } );
			}
			//update table list view
			this.updateTableList(roomArrary);
		}
		//
		private function onHosterJoined(hoster:String):void
		{
			//Remove pop-up connnecting overlay
			PopUpManager.removePopUp(this.connectingIndicatory);
			//Auto refresh the table list at lobby.
			if( FlexGlobals.playerIoPlugin )
			{
				FlexGlobals.playerIoPlugin.refreshRoomList();
				//Signal addOnce
				FlexGlobals.playerIoPlugin.signal_room_refreshed.addOnce(onRoomsRefreshed);
			}
		}
		//
		private function onUserJoined():void
		{
			//Remove the creating pop up
			if(PopUpManager.isPopUp(this.creatingIndicatory))
			{
				PopUpManager.removePopUp(this.creatingIndicatory);
			}
			if(PopUpManager.isPopUp(this.joinIndicator))
			{
				PopUpManager.removePopUp(this.joinIndicator);
			}
			//Refresh the room list.
			if( FlexGlobals.playerIoPlugin )
			{
//				playerIoPlugin.refreshRoomList();
//				//Signal addOnce
//				playerIoPlugin.signal_room_refreshed.addOnce(onRoomsRefreshed);
				//Go to the game scene
				FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_GAME);
			}
		}
		//
		private function onGameCreating():void
		{
			//Wait the game create latency.
			PopUpManager.addPopUp(creatingIndicatory,true,true);
//			PopUpManager.centerPopUp(creatingIndicatory);
			//Signal listen on playerIO plugin
			if( FlexGlobals.playerIoPlugin )
			{
				FlexGlobals.playerIoPlugin.signal_user_joined.addOnce(onUserJoined);
			}
		}
		//
		private function updateTableList(rooms:Array):void
		{
			this.collection.data = rooms;//Refresh the tabel tile-list.
			//relayout for view update.
			this._list.dataProvider = this.collection;
			this.layout();
		}
		//Call out the table detail information.
		private function list_changeHandler(event:Event):void
		{
			const content:Label = new Label();
			content.text = "OnlineUsers: ".concat(this._list.selectedItem.players);
			Callout.show(DisplayObject(content), this._button_join, Callout.DIRECTION_DOWN);
		}
	}
	
}