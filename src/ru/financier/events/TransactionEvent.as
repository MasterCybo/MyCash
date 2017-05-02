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
	public class TransactionEvent extends Event
	{
		public static const INCOME:String = "incomeTransaction"; // доход
		public static const CONSUME:String = "consumeTransaction"; // расход
		public static const TRANSFER:String = "transferTransaction"; // перевод

		private var _indexDeposit:int;
		
		public function TransactionEvent(type:String, indexDeposit:int, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_indexDeposit = indexDeposit;
			super(type, bubbles, cancelable);
		}
		
		public function get indexDeposit():int { return _indexDeposit; }
		
		public override function clone():Event
		{
			return new TransactionEvent(type, indexDeposit, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("TransactionEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}