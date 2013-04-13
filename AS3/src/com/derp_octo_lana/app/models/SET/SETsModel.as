
package com.derp_octo_lana.app.models.SET
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import feathers.data.ListCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	/**
	 * SETsModel.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Apr 13, 2013 10:01:52 PM
	 * @history 05/00/12,
	 */ 
	public class SETsModel extends Actor
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		[Embed(source="../../../../../assets/images/set_facts.png")]
		private static const ICONS_IMAGE:Class;
		
		[Embed(source="../../../../../assets/images/set_facts.xml",mimeType="application/octet-stream")]
		private static const ICONS_XML:Class;
		//
		private var _iconAtlas:TextureAtlas;
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
		public function SETsModel()
		{
			super();
			//
			this._iconAtlas = new TextureAtlas(Texture.fromBitmap(new ICONS_IMAGE(), false), XML(new ICONS_XML()));
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function getAssembledSets(level:int):ListCollection
		{
			var category:Array = [];
			var len:int = category.length;
			var collection:ListCollection = new ListCollection();
			for(var i:int=0;i<12;i++)
			{
				collection.push({label:"",texture: this._iconAtlas.getTexture("BLUE_DIAMONDS_3_STRIPED")});
			}
			return collection;
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