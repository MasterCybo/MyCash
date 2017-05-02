/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.commands
{
	import flash.events.Event;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.financier.collections.CurrencyID;
	import ru.financier.data.Currency;
	import ru.financier.data.Deposit;
	import ru.financier.data.ICurrency;
	import ru.financier.data.Tag;
	import ru.financier.managers.ICurrencyManager;
	import ru.financier.managers.IDepositsManager;
	import ru.financier.managers.ITagsManager;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class SetupCommand extends Command
	{
		public function SetupCommand(context:IContext, event:Event)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();

			var currencyManager:ICurrencyManager = getOf(ICurrencyManager);
			var rub:ICurrency = currencyManager.addCurrency(new Currency(CurrencyID.RUB, "руб.", "₽"));
			var usd:ICurrency = currencyManager.addCurrency(new Currency(CurrencyID.USD, "USD", "$"));

			var depositManager:IDepositsManager = getOf(IDepositsManager);
			depositManager.addDeposit(new Deposit("Наличка", 2000, rub));
			depositManager.addDeposit(new Deposit("Карта Visa", 10500, rub));
			depositManager.addDeposit(new Deposit("Карта Master Card", 5000, usd));

			var tagsManager:ITagsManager = getOf(ITagsManager);
			tagsManager.addTag(new Tag("перевод"));
			tagsManager.addTag(new Tag("оплата"));
			tagsManager.addTag(new Tag("разное"));
		}
	}
}
