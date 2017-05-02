/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IEntity
	{
		function get id():String;
		function set id(value:String):void;
		
		function get name():String;
		function set name(value:String):void;
		
		function toString():String;
	}
}
