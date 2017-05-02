/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Deposit extends Entity implements IDeposit
	{
		private var _money:IMoney;
		private var _transactions:Vector.<String> = new Vector.<String>();
		private var _description:String = "";

		public function Deposit(name:String, amount:Number = 0, currency:ICurrency = null)
		{
			super(name);
			_money = new Money(amount, currency);
		}

		public function dispose():void
		{
			_money.dispose();
			_money = null;
		}

		public function get money():IMoney { return _money; }

		public function get description():String { return _description; }
		public function set description(value:String):void { _description = value; }
		
		public function get transactions():Vector.<String> { return _transactions; }
		public function set transactions(value:Vector.<String>):void
		{
		}
		
		override public function toString():String
		{
			return name + ": " + _money.amount + " " + _money.currency.name;
		}
	}
}
