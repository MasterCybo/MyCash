/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ICurrency extends IEntity
	{
		function get symbol():String;
		function set symbol(value:String):void;
	}
}
