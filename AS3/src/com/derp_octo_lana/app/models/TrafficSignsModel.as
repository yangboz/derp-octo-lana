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
	 * @see http://www.jsyks.com/jtbz/zhishibiaozhi/%E6%8C%87%E7%A4%BA%E6%A0%87%E5%BF%97/1
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
		[Embed(source="../../../../assets/images/traffic_signs.png")]
		private static const ICONS_IMAGE:Class;
		
		[Embed(source="../../../../assets/images/traffic_signs.xml",mimeType="application/octet-stream")]
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
					{ text: "警告标志" , enabled:true},
					{ text: "禁令标志" , enabled:true},
					{ text: "指示标志" , enabled:true},
					{ text: "指路标志" , enabled:false},
					{ text: "旅游区标志" , enabled:false},
					{ text: "道路施工安全标志" , enabled:false},
					{ text: "辅助标志" , enabled:false}
				]
			},
			{
				header: "道路交通标线",
				children:
				[
					{ text: "禁止标线" , enabled:false},
					{ text: "指示标线" , enabled:false},
					{ text: "警告标线" , enabled:false},
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
			this.traffic_signs_categories['警告标志'] = [
				"十字交叉","T形交叉","T形交叉L","T形交叉R","Y形交叉","环形交叉","向左急弯路","向右急弯路","反向弯路","连续弯路","上陡坡","下陡坡","两侧变窄","右侧变窄","左侧变窄",
				"窄桥","双向交通","注意行人","注意儿童","注意牲畜","注意信号灯","注意落石L","注意落石R","注意横风","易滑","傍山险路R","傍山险路L","堤坝路L","堤坝路R","村庄",
				"隧道","渡口","驼峰桥","路面不平","过水路面","有人看守铁路道口","无人看守铁路道口","注意非机动车","事故易发路段","慢行","左右绕行","左侧绕行","右侧绕行","施工","注意危险",
				"斜杠符号","斜杠符号1","斜杠符号2","叉形符号"
			];
			this.traffic_signs_categories['禁令标志'] = [
				"禁止通行","禁止驶入","禁止机动车驶入","禁止载货汽车驶入","禁止三轮机动车驶入","禁止三轮机动车驶入",
				"禁止小型客车驶入","禁止汽车拖挂车驶入","禁止拖拉机驶入","禁止农用车驶入","禁止二轮摩托车驶入","禁止某两种车驶入",
				"禁止非机动车进入","禁止畜力车进入","禁止人力货运三轮车进入","禁止人力客运三轮车进入","禁止人力车进入","禁止骑自行车下坡",
				"禁止骑自行车上坡","禁止行人进入","禁止向左转弯","禁止向右转弯","禁止直行","禁止向左向右转弯",
				"禁止直行和向左转弯","禁止直行和向右转弯","禁止掉头","禁止超车","解除禁止超车","禁止车辆临时或长时停放",
				"禁止车辆长时停放","禁止鸣喇叭","限制宽度","限制高度","限制质量","限制轴重",
				"限制速度","解除限制速度","停车检查","停车让行","减速让行","会车让行","禁止运输危险物品车辆驶入标志",
			];
			this.traffic_signs_categories['指示标志'] = [
				"直行","向左转弯","向右转弯","直行和向左转弯","直行和向右转弯","向左和向右转弯","靠右侧道路行驶","靠左侧道路行驶","立交直行和左转弯行驶","立交直行和右转弯行驶",
				"环岛行驶","步行","鸣喇叭","最低限速","单行路向左或向右","单行路直行","干路先行","会车先行","人行横道","右转车道","直行车道","直行和右转合用车道","分向行驶车道",
				"公交线路专用车道","机动车行驶","机动车车道","非机动车行驶","非机动车车道","允许掉头"
			];
			this.traffic_signs_categories['指路标志'] = [
				
			];
			this.traffic_signs_categories['旅游区标识'] = [
				
			];
			this.traffic_signs_categories['道路施工安全标志'] = [
				
			];
			this.traffic_signs_categories['辅助标志'] = [
				
			];
			this.traffic_signs_categories['禁止标线'] = [
				
			];
			this.traffic_signs_categories['指示标线'] = [
				
			];
			this.traffic_signs_categories['警告标线'] = [
				
			];
		} 
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		public function getAssembledCategories(group:String):ListCollection
		{
			var category:Array = this.traffic_signs_categories[group];
			var len:int = category.length;
			var collection:ListCollection = new ListCollection();
			for(var i:int=0;i<len;i++)
			{
				collection.push({label:category[i],texture: this._iconAtlas.getTexture(category[i])});
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