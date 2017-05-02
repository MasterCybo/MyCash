/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier
{
	import ru.arslanov.starling.mvc.MVCStarling;
	import ru.arslanov.starling.mvc.extensions.FeathersMediatorMapExtension;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.financier.collections.ScreenName;
	import ru.financier.configs.AppConfig;
	import ru.financier.events.FeathersEvent;
	import ru.financier.events.ScreenEvent;
	import ru.financier.events.StartupEvent;
	import ru.financier.views.ContextView;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class AppRoot extends Sprite
	{
		public function AppRoot()
		{
			super();
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var contextView:ContextView = new ContextView();
			
			var context:IContext = MVCStarling.createContext(contextView).extend(FeathersMediatorMapExtension).configurate(AppConfig);
			context.dispatchEvent(new FeathersEvent(FeathersEvent.INIT));
			context.dispatchEvent(new StartupEvent(StartupEvent.SETUP));

			addChild(contextView);
			
			context.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.HOME));
		}
	}
}
