/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	import ru.financier.data.collections.ITagList;
	import ru.financier.data.collections.TagList;
	import ru.financier.data.operations.IOperation;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Transaction extends Entity implements ITransaction
	{
		private var _money:IMoney;
		private var _state:IStateTransaction = new StateTransaction(StateTransaction.EDITED);

		private var _deposit:IDeposit;

		private var _operation:IOperation;

		private var _tags:ITagList = new TagList();

		public function Transaction(deposit:IDeposit, amount:Number, name:String)
		{
			super(name);
			_deposit = deposit;
			_money = new Money(amount, _deposit.money.currency);
		}

		public function make():Boolean
		{
			_operation.apply(_deposit.money, _money);
			return true;
		}

		public function get tags():ITagList { return _tags; }

		public function get money():IMoney { return _money; }
		public function get state():IStateTransaction { return _state; }

		public function get operation():IOperation { return _operation; }
		public function set operation(value:IOperation):void { _operation = value; }

		public function get deposit():IDeposit { return _deposit; }
		public function set deposit(value:IDeposit):void { _deposit = value; }

		public function toString():String
		{
			var res:String = _deposit + "\n"
							+ name + "\n"
							+ _money + "\n"
							+ _state + "\n"
							+ _tags;
			return res;
		}
	}
}
