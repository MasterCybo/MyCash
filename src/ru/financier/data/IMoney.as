/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	import flash.events.IEventDispatcher;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IMoney extends IEventDispatcher
	{
		function dispose():void;
		
		function get deposit():IDeposit;
		function set deposit(deposit:IDeposit):void;
		
		function get amount():Number;
		function set amount(value:Number):void;

		function get currency():ICurrency;
		function set currency(value:ICurrency):void;
		
		function toShortFormat():String
	}
}
