
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
	 * @see http://smart-games.org/en/main/rules/
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
		public var setCards:Array = [];
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		//permute constants.
		public static const MAX_NUMBER_SETS:Number = 81;
		public static const MAX_PER_SETS:Number = 3;
		//All SET features.
		private static const ALL_COLORS:Array = [COLORs.BLUE,COLORs.GREEN,COLORs.RED];
		private static const ALL_NUMBERS:Array = [NUMBERs.ONE,NUMBERs.TWO,NUMBERs.THREE];
		private static const ALL_SHADINGS:Array = [SHADINGs.OPEN,SHADINGs.SOLID,SHADINGs.STRIPED];
		private static const ALL_SYMBOLS:Array = [SYMBOLs.DIAMONDS,SYMBOLs.OVALS,SYMBOLs.SQUIGGLES];
		private static const ALL_FACTS:Array = [
			
			[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,1],[1,1,2,2],[1,1,2,3],[1,1,3,1],[1,1,3,2],[1,1,3,3],
			[1,2,1,1],[1,2,1,2],[1,2,1,3],[1,2,2,1],[1,2,2,2],[1,2,2,3],[1,2,3,1],[1,2,3,2],[1,2,3,3],
			[1,3,1,1],[1,3,1,2],[1,3,1,3],[1,3,2,1],[1,3,2,2],[1,3,3,3],[2,1,1,1],[2,1,1,2],[2,1,1,3],
			
			[2,1,2,1],[2,1,2,2],[2,1,2,3],[2,1,3,1],[2,1,3,2],[2,1,3,3],[2,2,1,1],[2,2,1,2],[2,2,1,3],
			[2,2,2,1],[2,2,2,2],[2,2,2,3],[2,2,3,1],[2,2,3,2],[2,2,3,3],[2,3,1,1],[2,3,1,2],[2,3,1,3],
			[2,3,2,1],[2,3,2,2],[2,3,2,3],[2,3,3,1],[2,3,3,2],[2,3,3,3],[3,1,1,1],[3,1,1,2],[3,1,1,3],
			
			[3,1,2,1],[3,1,2,2],[3,1,2,3],[3,1,3,1],[3,1,3,2],[3,1,3,3],[3,2,1,1],[3,2,1,2],[3,2,1,3],
			[3,2,2,1],[3,2,2,2],[3,2,2,3],[3,2,3,1],[3,2,3,2],[3,2,3,3],[3,3,1,1],[3,3,1,2],[3,3,1,3],
			[3,3,1,1],[3,3,1,2],[3,3,1,3],[3,3,2,1],[3,3,2,2],[3,3,2,3],[3,3,3,1],[3,3,3,2],[3,3,3,3],
		];
		//@see http://smart-games.org/en/main/rules/
		private static const ALL_VALIDATED:Array = [1*1*1,2*2*2,3*3*3,1*2*3];//All the same or different
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
			//
			var facts:Array = MathUtil.randomPremutate(ALL_FACTS,12);
			LOG.info("SET facts:{0}",facts);
			var len:int = facts.length;
			var collection:ListCollection = new ListCollection();
			for(var i:int=0;i<len;i++)
			{
				var factStr:String = this.translateFact(facts[i]);
				collection.push({label:"",texture: this._iconAtlas.getTexture(factStr),SETfact:facts[i]});
			}
			return collection;
		}
		//
		public static function validateSet(setCards:Array):Boolean
		{
			var validated:Boolean = true;
			//All the same
			for(var i:int=0;i<MAX_PER_SETS;i++)
			{
				trace("result int value:",setCards[0][i]*setCards[1][i]*setCards[2][i]);
				if(ALL_VALIDATED.indexOf(int(setCards[0][i]*setCards[1][i]*setCards[2][i]))==-1) return false;//All the different
			}
			return validated;
		}
		//--------------------------------------------------------------------------
		//
		// Protected methods
		//
		//--------------------------------------------------------------------------
		//color
		private function getColorValue(color:String):int
		{
			if(color=="BLUE") return COLORs.BLUE;
			if(color=="RED") return COLORs.RED;
			if(color=="GREEN") return COLORs.GREEN;
			return null;
		}
		//symbol
		private function getSymbolValue(symbol:String):int
		{
			if(symbol=="DIAMONDS") return SYMBOLs.DIAMONDS;
			if(symbol=="OVALS") return SYMBOLs.OVALS;
			if(symbol=="SQUIGGLES") return SYMBOLs.SQUIGGLES;
			return null;
		}
		//shading
		private function getShadingValue(shading:String):int
		{
			if(shading=="OPEN") return SHADINGs.OPEN;
			if(shading=="SOLID") return SHADINGs.SOLID;
			if(shading=="STRIPED") return SHADINGs.STRIPED;
			return null;
		}
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function buildAllSetCards():void
		{
			for(var i:int=0;i<MAX_NUMBER_SETS;i++)
			{
				var setFact:String = this.translateFact(ALL_FACTS[i]);
				//
				this.setCards.push(setFact);
			}
			LOG.info("setCards:{0}",this.setCards);
		}
		//
		private function translateFact(fact:Array):String
		{
			var builder:SET_FactsBuilder = new SET_FactsBuilder();
			builder = builder.withColor(fact[0])
				.withNumber(fact[1])
				.withShading(fact[2])
				.withSymbol(fact[3]);
			//
			var setFacts:SET_Facts = new SET_Facts(builder);
			return setFacts.toString();
		}
	}
	
}