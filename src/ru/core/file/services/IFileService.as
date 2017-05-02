/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.services
{
	import flash.events.IEventDispatcher;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IFileService extends IEventDispatcher
	{
		function save(data:String):void;
	}
}
