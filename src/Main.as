package
{
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import ru.arslanov.starling.StarlingManager;
	import ru.financier.AppRoot;
	
	[SWF(frameRate="60")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			StarlingManager.create(AppRoot, stage);

//			new TestData();
		}
	}
}
