
package com.derp_octo_lana.app.consts
{
	import com.derp_octo_lana.app.models.UserModel;
	import com.godpaper.as3.plugins.playerIO.PlayerIoPlugin;
	import com.godpaper.as3.utils.SingletonFactory;
	
	import flash.display.Stage;
	
	import feathers.controls.ScreenNavigator;

	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * FlexGlobals.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 9, 2013 5:43:21 PM
	 * @history 05/00/12,
	 */ 
	public class FlexGlobals
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		public static var screenNavigator:ScreenNavigator;
		public static var flashStage:Stage;
		//Model
		public static var userModel:UserModel = SingletonFactory.produce(UserModel);
		//Plugin
		public static var playerIoPlugin:PlayerIoPlugin = SingletonFactory.produce(PlayerIoPlugin);
		//Game turn flag init.(0,1,2...)
		public static var turnFlag:int;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		public static const SCREEN_SPLASH:String = "screen_splash";
		public static const SCREEN_MAIN_MENU:String = "screen_main_menu";
		public static const SCREEN_GAME:String = "screen_game";
		public static const SCREEN_HANDSHAKE:String = "screen_handshake";
		public static const SCREEN_SETTINGS:String = "screen_settings";
		public static const SCREEN_HELP:String = "screen_help";
		public static const SCREEN_LOOBY:String = "screen_looby";
		public static const SCREEN_TRAFFIC_SIGNS:String = "screen_traffic_signs";
		//about chess pieces' flag
		public static const FLAG_RED:uint=0;//0(000)
		public static const FLAG_BLUE:uint=1<<0;//1(010)
		public static const FLAG_GREEN:uint=1<<1;//2(100)
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