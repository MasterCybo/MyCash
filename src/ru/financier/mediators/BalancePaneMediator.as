/**
 * Created by Artem-Home on 18.03.2017.
 */
package ru.financier.mediators
{
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	import ru.financier.collections.CurrencyID;
	import ru.financier.collections.ScreenName;
	import ru.financier.data.ICurrency;
	import ru.financier.data.IDeposit;
	import ru.financier.data.Money;
	import ru.financier.events.ScreenEvent;
	import ru.financier.managers.ICurrencyManager;
	import ru.financier.managers.IDepositsManager;
	import ru.financier.views.components.BalancePane;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class BalancePaneMediator extends Mediator
	{
		public function BalancePaneMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			var currencyManager:ICurrencyManager = getOf(ICurrencyManager);
			var currency:ICurrency = currencyManager.getCurrency(CurrencyID.RUB);
			var total:Money = new Money(0, currency);
			
			var depositManager:IDepositsManager = getOf(IDepositsManager);
			var deposit:IDeposit;
			for (var i:int = 0; i < depositManager.numDeposits; i++) {
				deposit = depositManager.getDepositAt(i);
				if (deposit.money.currency.id == total.currency.id) {
					total.amount += deposit.money.amount;
				}
			}
			
			view.totalCash = total;
			
			view.addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		private function get view():BalancePane { return getView() as BalancePane; }
		
		private function touchHandler(event:TouchEvent):void
		{
			var touch:Touch = event.touches[0];
			if (touch.phase == TouchPhase.ENDED) {
				dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.DEPOSITES))
			}
		}
	}
}
