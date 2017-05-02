/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	import flash.events.EventDispatcher;
	import flash.globalization.NumberFormatter;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Money extends EventDispatcher implements IMoney
	{
		public static var _numberFormatter:NumberFormatter;
		
		private var _amount:Number = 0;
		private var _currency:ICurrency;
		private var _deposit:IDeposit;

		public function Money(amount:Number = 0, currency:ICurrency = null)
		{
			super();
			_amount = amount;
			_currency = currency;
			
			if (!_numberFormatter) {
				_numberFormatter = new NumberFormatter("ru_RU");
				_numberFormatter.groupingSeparator = " ";
				_numberFormatter.groupingPattern = "3;*";
			}
		}

		public function dispose():void
		{
			_currency = null;
			_deposit = null;
		}
		
		public function get deposit():IDeposit { return _deposit; }
		public function set deposit(value:IDeposit):void { _deposit = value; }
		
		public function get amount():Number { return _amount; }
		public function set amount(value:Number):void { _amount = value; }

		public function get currency():ICurrency { return _currency; }
		public function set currency(value:ICurrency):void { _currency = value; }
		
		public function toShortFormat():String
		{
			return _numberFormatter.formatNumber(_amount) + " " + _currency.symbol;
		}
		
		override public function toString():String
		{
			return _amount + " " + _currency.name;
		}
	}
}
