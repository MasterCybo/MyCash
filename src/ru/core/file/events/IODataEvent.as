/**
 * Copyright (c) 2015 Artem Arslanov. All rights reserved.
 */
package ru.core.file.events {
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class IODataEvent extends Event {

		public static const LOAD:String = "loadSettingsEvent";
		public static const SAVE:String = "saveSettingsEvent";

		public function IODataEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new IODataEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("IODataEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}