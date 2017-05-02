/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	
	import ru.financier.data.IDeposit;

	import flash.utils.Dictionary;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class DepositsManager implements IDepositsManager
	{
		private var _deposits:Vector.<IDeposit> = new Vector.<IDeposit>();
		private var _mapDeposits:Dictionary = new Dictionary();
		private var _numDeposits:uint;

		public function DepositsManager()
		{
		}

		public function get numDeposits():uint { return _numDeposits; }

		public function hasDeposit(deposit:IDeposit):Boolean { return _mapDeposits[deposit.id] != undefined; }

		public function getDepositAt(index:uint):IDeposit
		{
			if (index < 0 || index >= _numDeposits) return null;
			return _deposits[index];
		}

		public function getDepositByID(id:String):IDeposit { return _mapDeposits[id]; }
		
		public function addDeposit(deposit:IDeposit):IDeposit
		{
			if (hasDeposit(deposit)) return null;
			_deposits.push(deposit);
			deposit.id = String(_deposits.length);
			_mapDeposits[deposit.id] = deposit;
			_numDeposits++;
			return deposit;
		}

		public function removeDeposit(deposit:IDeposit):void
		{
			if (!hasDeposit(deposit)) return;
			var idx:int = _deposits.indexOf(deposit);
			if (idx != -1) {
				_deposits.splice(idx, 1);
				delete _mapDeposits[deposit.id];
				deposit.id = null;
				_numDeposits--;
			}
		}

		public function removeAllDeposits():void
		{
			_deposits = new Vector.<IDeposit>();
			_mapDeposits = new Dictionary();
			_numDeposits = 0;
		}
		
		public function get deposits():Vector.<IDeposit>
		{
			return _deposits;
		}
	}
}
