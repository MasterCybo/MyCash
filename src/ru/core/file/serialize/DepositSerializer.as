/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.serialize
{
	import ru.financier.data.IDeposit;
	import ru.financier.managers.ICurrencyManager;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class DepositSerializer implements IJSONSerializer
	{
		private var _currencyManager:ICurrencyManager;
		
		public function DepositSerializer(currencyManager:ICurrencyManager)
		{
			_currencyManager = currencyManager;
		}
		
		public function destroy():void
		{
			_currencyManager = null;
		}
		
		public function deserialize(target:Object, json:String):void
		{
			var data:Object = JSON.parse(json);
			
			var deposit:IDeposit = target as IDeposit;
			deposit.id = data.id;
			deposit.name = data.name;
			deposit.description = data.comment;
			deposit.currency = _currencyManager.getCurrency(data.currencyID);
			deposit.transactions = Vector.<String>(data.transactions);
		}
		
		public function serialize(object:Object):String
		{
			var deposit:IDeposit = object as IDeposit;
			
			var data:Object = {
				id:deposit.id,
				name:deposit.name,
				comment:deposit.description,
				currencyID:deposit.currency.id,
				transactions:deposit.transactions
			};
			return JSON.stringify(data);
		}
	}
}
