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
	 * Доход
	 * @author Artem Arslanov
	 */
	public class ConsumeCommand extends Command
	{
		public function ConsumeCommand(context:IContext, event:TransactionEvent)
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
