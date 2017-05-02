/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IDeposit extends IEntity
	{
		function dispose():void;
		
		function get money():IMoney;
		
		function get description():String;
		function set description(value:String):void;
		
		function get transactions():Vector.<String>;
		function set transactions(value:Vector.<String>):void;
	}
}
