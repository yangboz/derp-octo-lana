package com.derp_octo_lana.app.views.popups
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import feathers.controls.Header;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;

	/**
	 * IndicatoryBase.as class.The base class of all indicatory with popup behavior.   	
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Aug 23, 2012 5:17:27 PM
	 */   	 
	public class IndicatoryBase extends Screen
//	public class IndicatoryBase extends PanelScreen
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		protected var hLayout:HorizontalLayout;
		protected var vLayout:VerticalLayout;
		protected var _header:Header;
		protected var _container:ScrollContainer;
		protected var _bgQuad:Quad;
		//background skin
		protected var _image:Image;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		[Embed(source="../../../../../assets/images/metalworks/pattern-background-tile.png")]
		private static const BACK_GROUND_TEXTURE:Class;
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
		public function IndicatoryBase()
		{
			super();
			//layout 
			hLayout = new HorizontalLayout();
			hLayout.gap = 10;
			hLayout.paddingTop = 10;
			hLayout.paddingRight = 10;
			hLayout.paddingBottom = 10;
			hLayout.paddingLeft = 10;
			hLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			hLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
			//
			vLayout = new VerticalLayout();
			vLayout.gap = 10;
			vLayout.paddingTop = 10;
			vLayout.paddingRight = 10;
			vLayout.paddingBottom = 10;
			vLayout.paddingLeft = 10;
			vLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			vLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
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
		override protected function initialize():void
		{
			//backgroundSkin
//			var bgTexture:Texture = AzureTheme.ATLAS.getTexture("list-item-up-skin");//list-item-selected,list-item-selected-skin
			this._image = new Image(Texture.fromBitmap(new BACK_GROUND_TEXTURE(), false));
//			this._image = new Image(bgTexture);
			this.addChild(this._image);
			//header title
			this._header = new Header();
			this._header.title = "???";
			this.addChild(this._header);
			//container
			this._container = new ScrollContainer();
			this._container.layout = vLayout;//default layout
			this._container.scrollerProperties.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this._container.scrollerProperties.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this.addChild(this._container);
			//Append the customize initialization.
		}
		//
		override protected function draw():void
		{
//			_bgQuad = new Quad(this.actualWidth,this.actualHeight,0x030303);
//			_bgQuad.alpha = 0.5;
//			_bgQuad.blendMode = BlendMode.NONE;
//			this.addChild(_bgQuad);
			//
			this._header.width = this.actualWidth;
			this._header.validate();
			//			
			this._container.y = this._header.height;
			this._container.width = this.actualWidth;
			this._container.height = this.actualHeight - this._container.y;
			this._container.validate();
			//
			this._image.width = this.actualWidth;
			this._image.height = this.actualHeight;

		}
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}