
package com.derp_octo_lana.app.models.SET
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.COLORs;
	import com.derp_octo_lana.app.consts.NUMBERs;
	import com.derp_octo_lana.app.consts.SHADINGs;
	import com.derp_octo_lana.app.consts.SYMBOLs;
	import com.godpaper.as3.utils.LogUtil;
	import com.godpaper.as3.utils.MathUtil;
	
	import mx.logging.ILogger;
	
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
		//
		public var setCards:Vector.<String> = new Vector.<String>();
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		//permute constants.
		private static const MAX_NUMBER_SETS:Number = 81;
		private static const MAX_PER_SETS:Number = 3;
		//All SET features.
		private static const ALL_COLORS:Array = [COLORs.BLUE,COLORs.GREEN,COLORs.RED];
		private static const ALL_NUMBERS:Array = [NUMBERs.ONE,NUMBERs.TWO,NUMBERs.THREE];
		private static const ALL_SHADINGS:Array = [SHADINGs.OPEN,SHADINGs.SOLID,SHADINGs.STRIPED];
		private static const ALL_SYMBOLS:Array = [SYMBOLs.DIAMONDS,SYMBOLs.OVALS,SYMBOLs.SQUIGGLES];
		//
		private static const LOG:ILogger = LogUtil.getLogger(SETsModel);
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
			//
			this.buildAllSetCards();
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function getAssembledSets(level:int):ListCollection
		{
			var category:Array = MathUtil.permutateArray([],MAX_PER_SETS);
			var len:int = category.length;
			var collection:ListCollection = new ListCollection();
			for(var i:int=0;i<12;i++)
			{
				collection.push({label:"",texture: this._iconAtlas.getTexture("BLUE_SQUIGGLES_3_STRIPED")});
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
		private function buildAllSetCards():void
		{
			for(var i:int=0;i<MAX_PER_SETS;i++)
			{
				var builder:SET_FactsBuilder = new SET_FactsBuilder();
				builder = builder.withColor(ALL_COLORS[i]);
				builder = builder.withNumber(ALL_NUMBERS[i]);
				builder = builder.withShading(ALL_SHADINGS[i]);
				builder = builder.withSymbol(ALL_SYMBOLS[i]);
				var setFacts:SET_Facts = new SET_Facts(builder);
				this.setCards.push(setFacts.toString());
			}
			LOG.info("setCards:{0}",this.setCards);
		}
	}
	
}