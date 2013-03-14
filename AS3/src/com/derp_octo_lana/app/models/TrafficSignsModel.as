
package com.derp_octo_lana.app.models
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.godpaper.as3.utils.LogUtil;
	
	import flash.utils.Dictionary;
	
	import mx.logging.ILogger;
	
	import feathers.data.ListCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	/**
	 * TrafficSignsModel.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 14, 2013 10:00:21 PM
	 * @history 05/00/12,
	 */ 
	public class TrafficSignsModel extends Actor
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		[Embed(source="../../../../assets/images/traffic_signs/traffic_signs.png")]
		private static const ICONS_IMAGE:Class;
		
		[Embed(source="../../../../assets/images/traffic_signs/traffic_signs.xml",mimeType="application/octet-stream")]
		private static const ICONS_XML:Class;
		//
		private var _iconAtlas:TextureAtlas;
		private var _font:BitmapFont;
		//Categories
		public var traffic_signs_categories:Dictionary = new Dictionary();
		//Groups
		public var traffic_signs_groups:Array = 
		[
			{
				header: "道路交通标志",
				children:
				[
					{ text: "警告标志" },
					{ text: "禁令标志" },
					{ text: "指示标志" },
					{ text: "指路标志" },
					{ text: "旅游区标志" },
					{ text: "道路施工安全标志" },
					{ text: "辅助标志" }
				]
			},
			{
				header: "道路交通标线",
				children:
				[
					{ text: "禁止标线" },
					{ text: "指示标线" },
					{ text: "警告标线" },
				]
			}
		];
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(TrafficSignsModel);
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
		public function TrafficSignsModel()
		{
			super();
			//
			this._iconAtlas = new TextureAtlas(Texture.fromBitmap(new ICONS_IMAGE(), false), XML(new ICONS_XML()));
			//			this._font = new BitmapFont(this._iconAtlas.getTexture("arial20_0"), XML(new FONT_XML()));
			//Static data sets initialization.
			this.traffic_signs_categories['警告标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['禁令标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['指示标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['指路标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['旅游区标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['道路施工安全标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['辅助标志'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			//
			this.traffic_signs_categories['禁止标线'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['指示标线'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
			this.traffic_signs_categories['警告标线'] = new ListCollection(
				[
					{ label: "T形交叉", texture: this._iconAtlas.getTexture("T形交叉") },
				]);
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