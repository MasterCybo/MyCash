/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	import ru.financier.collections.CurrencyID;
	import ru.financier.data.ICurrency;

	import flash.utils.Dictionary;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class CurrencyManager implements ICurrencyManager
	{
		private var _currency:Vector.<ICurrency> = new Vector.<ICurrency>();
		private var _mapCurrency:Dictionary = new Dictionary();
		private var _numCurrency:int;

		public function CurrencyManager()
		{
		}

		public function hasCurrency(currency:ICurrency):Boolean
		{
			return _mapCurrency[currency.id] != undefined;
		}

		public function getCurrencyAt(index:uint):ICurrency
		{
			if (index < 0 || index >= _numCurrency) return null;
			return _currency[index];
		}

		public function getCurrency(currencyID:CurrencyID):ICurrency
		{
			return _mapCurrency[currencyID.id];
		}

		public function addCurrency(currency:ICurrency):ICurrency
		{
			if (hasCurrency(currency)) return null;
			_currency.push(currency);
			_mapCurrency[currency.id] = currency;
			_numCurrency++;
			return currency;
		}

		public function removeCurrency(currency:ICurrency):void
		{
			if (!hasCurrency(currency)) return;
			var idx:int = _currency.indexOf(currency);
			if (idx != -1) {
				_currency.splice(idx, 1);
				delete _mapCurrency[currency.id];
				currency.id = null;
				_numCurrency--;
			}
		}

		public function removeAllCurrency():void
		{
			_currency = new Vector.<ICurrency>();
			_mapCurrency = new Dictionary();
			_numCurrency = 0;
		}
	}
}
