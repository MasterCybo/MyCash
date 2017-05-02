/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.configs
{
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.financier.commands.IncomeCommand;
	import ru.financier.commands.InitFeathersCommand;
	import ru.financier.commands.SetupCommand;
	import ru.financier.commands.TransferCommand;
	import ru.financier.events.FeathersEvent;
	import ru.financier.events.StartupEvent;
	import ru.financier.events.TransactionEvent;
	import ru.financier.managers.CurrencyManager;
	import ru.financier.managers.DepositsManager;
	import ru.financier.managers.ICurrencyManager;
	import ru.financier.managers.IDepositsManager;
	import ru.financier.managers.ITagsManager;
	import ru.financier.managers.TagsManager;
	import ru.financier.mediators.ContextViewMediator;
	import ru.financier.mediators.CurrencyScreenMediator;
	import ru.financier.mediators.DepositsScreenMediator;
	import ru.financier.mediators.HomeScreenMediator;
	import ru.financier.mediators.TagsScreenMediator;
	import ru.financier.mediators.BalancePaneMediator;
	import ru.financier.mediators.TransactionScreenMediator;
	import ru.financier.views.ContextView;
	import ru.financier.views.components.BalancePane;
	import ru.financier.views.screens.CurrencyScreen;
	import ru.financier.views.screens.DepositsScreen;
	import ru.financier.views.screens.HomeScreen;
	import ru.financier.views.screens.TagsScreen;
	import ru.financier.views.screens.TransactionScreen;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class AppConfig extends Config
	{
		public function AppConfig(context:IContext)
		{
			super(context);
		}

		override public function initialize():void
		{
			super.initialize();
			
			initSingletons();
			initMediators();
			initCommands();
		}
		
		private function initSingletons():void
		{
			map(IDepositsManager).asSingleton(DepositsManager);
			map(ICurrencyManager).asSingleton(CurrencyManager);
			map(ITagsManager).asSingleton(TagsManager);
//			map(IFileService).asSingleton(DataFileService);
		}
		
		private function initMediators():void
		{
			map(ContextViewMediator).toMediate(ContextView);
			
			map(HomeScreenMediator).toMediate(HomeScreen);
			map(DepositsScreenMediator).toMediate(DepositsScreen);
			map(CurrencyScreenMediator).toMediate(CurrencyScreen);
			map(TagsScreenMediator).toMediate(TagsScreen);
			map(TransactionScreenMediator).toMediate(TransactionScreen);
			
			map(BalancePaneMediator).toMediate(BalancePane);
		}
		
		private function initCommands():void
		{
			map(FeathersEvent.INIT).toCommand(InitFeathersCommand);
			map(StartupEvent.SETUP).toCommand(SetupCommand);
			map(TransactionEvent.INCOME).toCommand(IncomeCommand);
			map(TransactionEvent.CONSUME).toCommand(TransferCommand);
			
//			map(IODataEvent.LOAD).toCommand(LoadDataCommand);
//			map(IODataEvent.SAVE).toCommand(SaveDataCommand);
		}
	}
}
