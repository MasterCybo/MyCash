/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.commands
{
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.financier.events.TransactionEvent;
	import ru.financier.data.IDeposit;
	import ru.financier.managers.IDepositsManager;
	
	
	/**
	 * Расход
	 * @author Artem Arslanov
	 */
	public class TransferCommand extends Command
	{
		public function TransferCommand(context:IContext, event:TransactionEvent)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();
			
			var indexDeposit:int = TransactionEvent(getEvent()).indexDeposit;
			
			var depositManager:IDepositsManager = getOf(IDepositsManager);
			var deposit:IDeposit = depositManager.getDepositAt(indexDeposit);
			deposit.money.amount -= 10;
		}
	}
}
