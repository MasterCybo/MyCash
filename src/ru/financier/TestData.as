/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier
{
	import ru.financier.data.Currency;
	import ru.financier.data.Deposit;
	import ru.financier.data.ICurrency;
	import ru.financier.data.IDeposit;
	import ru.financier.data.ITransaction;
	import ru.financier.data.Tag;
	import ru.financier.data.Transaction;
	import ru.financier.data.operations.SubOperation;
	import ru.financier.managers.CurrencyManager;
	import ru.financier.managers.DepositsManager;
	import ru.financier.managers.ICurrencyManager;
	import ru.financier.managers.IDepositsManager;
	import ru.financier.managers.ITagsManager;
	import ru.financier.managers.TagsManager;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class TestData
	{
		public function TestData()
		{
			var depositsManager:IDepositsManager = new DepositsManager();
			var currencyManager:ICurrencyManager = new CurrencyManager();
			var tagsManager:ITagsManager = new TagsManager();

			var rub:ICurrency = currencyManager.addCurrency(new Currency("руб.", "P"));
			var usd:ICurrency = currencyManager.addCurrency(new Currency("USD", "$"));

			var wallet:IDeposit = depositsManager.addDeposit(new Deposit("Кошелёк", 2000, rub));
			var visa:IDeposit = depositsManager.addDeposit(new Deposit("Карта Visa", 10500, rub));

			tagsManager.addTag(new Tag("перевод"));
			tagsManager.addTag(new Tag("оплата"));
			tagsManager.addTag(new Tag("разное"));

			trace("wallet :\n" + wallet);
			trace("visa :\n" + visa);

			var transaction:ITransaction = new Transaction(wallet, 100, "Денежный перевод");
			transaction.state.name = "Выполнено";
			transaction.operation = new SubOperation();
			transaction.tags.addTag(tagsManager.getTagAt(1));
//			transaction.tags.addTag(tagsManager.getTagAt(2));
			transaction.tags.addTag(tagsManager.getTagAt(0));
			transaction.make();

			trace("transaction :\n" + transaction);
		}
	}
}
