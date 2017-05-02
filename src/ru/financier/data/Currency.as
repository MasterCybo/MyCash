/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	import ru.financier.collections.CurrencyID;
	
	import starling.errors.AbstractMethodError;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Currency extends Entity implements ICurrency
	{
		private var _symbol:String;

		public function Currency(currencyID:CurrencyID, name:String, symbol:String = null)
		{
			super(name);
			_id = currencyID.id;
			_symbol = symbol;
		}
		
		/**
		 * Защита от переопределения
		 * @param value
		 */
		override public function set id(value:String):void
		{
			throw new AbstractMethodError("Method disabled");
		}
		
		public function get symbol():String { return _symbol; }
		public function set symbol(value:String):void { _symbol = value; }
	}
}
