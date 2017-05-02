/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.events
{
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class StartupEvent extends Event
	{
		public static const SETUP:String = "setup";

		public function StartupEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new StartupEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("StartupEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}