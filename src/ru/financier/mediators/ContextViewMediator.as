/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.financier.mediators
{
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	import ru.financier.events.ScreenEvent;
	import ru.financier.views.ContextView;
	
	import starling.display.DisplayObject;
	
	public class ContextViewMediator extends Mediator
	{
		public static const MAX_HISTORY:int = 5;
		
		private var _view:ContextView;
		private var _history:Vector.<String> = new Vector.<String>();
		
		public function ContextViewMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			_view = displayObject as ContextView;
			
			addContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			addContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
		}
		
		override public function destroy():void
		{
			removeContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			removeContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
			super.destroy();
			_view = null;
		}
		
		private function showScreenHandler(event:ScreenEvent):void
		{
			switch (event.type) {
				case ScreenEvent.SHOW_SCREEN:
					showScreen(event.name, event.data);
					break;
				case ScreenEvent.SHOW_PREVIOUS:
					showScreen(popFromHistory());
					break;
			}
		}
		
		private function showScreen(name:String, properties:Object = null):void
		{
			if (!name || name == _view.activeScreenID) return;
			if (properties) _view.getScreen(name).properties.data = properties;
			_view.showScreen(name);
			pushToHistory(name);
		}
		
		private function pushToHistory(name:String):void
		{
			if (_history.length >= MAX_HISTORY) _history.shift();
			_history.push(name);
		}
		
		private function popFromHistory():String
		{
			if (_history.length < 2) return null;
			
			_history.pop();
			return _history.pop();
		}
	}
}
