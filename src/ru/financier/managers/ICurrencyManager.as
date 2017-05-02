/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	import ru.financier.collections.CurrencyID;
	import ru.financier.data.ICurrency;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ICurrencyManager
	{
		function hasCurrency(currency:ICurrency):Boolean;

		function getCurrencyAt(index:uint):ICurrency;
		
		function getCurrency(currencyID:CurrencyID):ICurrency;
		
		function addCurrency(currency:ICurrency):ICurrency;
		
		function removeCurrency(currency:ICurrency):void;

		function removeAllCurrency():void
	}
}
