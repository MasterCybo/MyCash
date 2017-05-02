/**
 * Created by Artem on 02.04.2016.
 */
package ru.core.file.events {
	import flash.events.Event
	
	public class FileServiceEvent extends Event {

		public static const COMPLETE:String = "completeSettingsLoaderEvent";
		public static const ERROR:String = "errorSettingsLoaderEvent";

		public function FileServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new FileServiceEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("FileServiceEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}
