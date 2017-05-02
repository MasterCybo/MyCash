/**
 * Created by Artem-Home on 18.03.2017.
 */
package ru.core.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class View extends Sprite
	{
		public function View()
		{
			super();
			stage ? addedHandler() : addEventListener(Event.ADDED, addedHandler);
			touchable = false;
		}
		
		protected function addedHandler(event:Event = null):void
		{
			removeEventListener(Event.ADDED, addedHandler);
			addEventListener(Event.REMOVED, removedHandler);
		}
		
		protected function removedHandler(event:Event):void
		{
			removeEventListener(Event.ADDED, addedHandler);
			removeEventListener(Event.REMOVED, removedHandler);
		}
	}
}
