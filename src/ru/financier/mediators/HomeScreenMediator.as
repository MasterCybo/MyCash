/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.mediators
{
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	import ru.financier.events.TransactionEvent;
	import ru.financier.data.IDeposit;
	import ru.financier.data.IMoney;
	import ru.financier.managers.IDepositsManager;
	import ru.core.views.controls.BubblingButton;
	import ru.financier.views.screens.HomeScreen;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class HomeScreenMediator extends Mediator
	{
		private var _indexDeposite:int = 0;
		private var _deposite:IDeposit;
		
		public function HomeScreenMediator(context:IContext)
		{
			super(context);
		}

		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);

			var depositManager:IDepositsManager = getOf(IDepositsManager);
			_deposite = depositManager.getDepositAt(_indexDeposite);
			var money:IMoney = _deposite.money;

//			view.setDepositTotal(money.amount, money.currency.symbol);
			
			var deposit:IDeposit;
//			for (var i:int = 0; i < depositManager.numDeposits; i++) {
//				deposit = depositManager.getDepositAt(i);
//				view.displayDeposite(deposit.name, deposit.money.amount, deposit.money.currency.symbol);
//			}

			view.addEventListener(Event.TRIGGERED, onTriggeredButton);
		}
		
		override public function destroy():void
		{
			view.removeEventListener(Event.TRIGGERED, onTriggeredButton);
			super.destroy();
			_deposite = null;
		}
		
		private function onTriggeredButton(event:Event):void
		{
			var target:BubblingButton = event.target as BubblingButton;
			
			switch (target.name) {
				case HomeScreen.BUTTON_GAIN:
					trace(target.name);
					dispatchEvent(new TransactionEvent(TransactionEvent.INCOME, _indexDeposite));
					break;
				case HomeScreen.BUTTON_WASTE:
					trace(target.name);
					dispatchEvent(new TransactionEvent(TransactionEvent.CONSUME, _indexDeposite));
					break;
			}
			
			view.setDepositTotal(_deposite.money.amount, _deposite.money.currency.symbol);
		}

		public function get view():HomeScreen { return getView() as HomeScreen; }
	}
}
