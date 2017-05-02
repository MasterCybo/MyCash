/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.serialize
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IJSONSerializer
	{
		function destroy():void;
		function deserialize(target:Object, json:String):void;
		function serialize(object:Object):String;
	}
}
