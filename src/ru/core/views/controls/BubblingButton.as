/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.views.controls
{
	import feathers.controls.Button;

	import starling.events.Event;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class BubblingButton extends Button
	{
		public function BubblingButton()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			addEventListener(Event.TRIGGERED, onTriggered);
		}

		private function onRemoveFromStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			removeEventListener(Event.TRIGGERED, onTriggered);
		}

		private function onTriggered(event:Event):void
		{
			removeEventListener(Event.TRIGGERED, onTriggered);
			dispatchEventWith(event.type, true, event.data);
			addEventListener(Event.TRIGGERED, onTriggered);
		}
	}
}
