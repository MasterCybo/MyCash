/**
 * Created by Artem-Home on 18.03.2017.
 */
package ru.core.views
{
	import feathers.core.FeathersControl;
	
	import starling.events.Event;
	
	public class ViewFeathers extends FeathersControl
	{
		public function ViewFeathers()
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
