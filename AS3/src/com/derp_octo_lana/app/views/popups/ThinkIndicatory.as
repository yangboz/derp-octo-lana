package com.derp_octo_lana.app.views.popups
{
	//--------------------------------------------------------------------------
	//
	//  Imports
	//
	//--------------------------------------------------------------------------
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	
	
	/**
	 * Callout/popup view component that indicated the computer thinking status.
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Jun 20, 2012 1:41:57 PM
	 */   	 
	public class ThinkIndicatory extends IndicatoryBase
	{		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
//		private var _progressTween:GTween;//Foxhole extended GTween.
		private var _progressTween:Tween;
		private var _progress:ProgressBar;
		private var _label:Label;
		//
		private var _label_value:String;
		//----------------------------------
		//  CONSTANTS
		//----------------------------------
		
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
		public function ThinkIndicatory(label:String="")
		{
			super();
			//
			if(!label)
			{
				this._label_value = ("LOADING");
			}else
			{
				this._label_value = label;
			}
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
			//
			this._progress = new ProgressBar();
			this._progress.minimum = 0;
			this._progress.maximum = 1;
			this._progress.value = 0;
			this.addChild(this._progress);
			//
//			this._progressTween = new GTween(this._progress, 5,
			this._progressTween = new Tween(this._progress, 2,Transitions.EASE_IN);
			this._progressTween.animate("value",100);
			this._progressTween.repeatCount = 0;
			Starling.juggler.add(this._progressTween); 
			//
			this._label = new Label();
			this._label.text = this._label_value;
			this.addChild(this._label);
		}
		
		override protected function draw():void
		{
			this._progress.validate();
			this._progress.x = (this.actualWidth - this._progress.width) / 2;
			this._progress.y = (this.actualHeight - this._progress.height) / 2;
			//
			this._label.validate();
			this._label.x = (this.actualWidth - this._label.width) / 2;
			this._label.y = (this.actualHeight - this._label.height) / 2 - this._progress.height*3;//more gap.
		}
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
	}
	
}