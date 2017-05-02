/**
 * Created by Artem-Home on 16.03.2017.
 */
package ru.financier.events
{
	import flash.events.Event;
	
	public class FeathersEvent extends Event
	{
		public static const INIT:String = "initFeathersEvent";
		
		public function FeathersEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
