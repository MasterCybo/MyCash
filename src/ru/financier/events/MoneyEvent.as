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
	public class MoneyEvent extends Event
	{
		
		public function MoneyEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new MoneyEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("MoneyEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}