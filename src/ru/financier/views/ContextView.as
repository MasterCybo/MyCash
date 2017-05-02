/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.financier.views
{
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	
	import ru.financier.collections.ScreenName;
	import ru.financier.views.screens.CurrencyScreen;
	import ru.financier.views.screens.DepositsScreen;
	import ru.financier.views.screens.HomeScreen;
	import ru.financier.views.screens.TagsScreen;
	import ru.financier.views.screens.TransactionScreen;
	
	public class ContextView extends ScreenNavigator
	{
		public function ContextView()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var screenItem:ScreenNavigatorItem = new ScreenNavigatorItem(HomeScreen);
			addScreen(ScreenName.HOME, screenItem);
			
			screenItem = new ScreenNavigatorItem(DepositsScreen);
			addScreen(ScreenName.DEPOSITES, screenItem);
			
			screenItem = new ScreenNavigatorItem(CurrencyScreen);
			addScreen(ScreenName.CURRENCY, screenItem);
			
			screenItem = new ScreenNavigatorItem(TagsScreen);
			addScreen(ScreenName.TAGS, screenItem);
			
			screenItem = new ScreenNavigatorItem(TransactionScreen);
			addScreen(ScreenName.TRANSACTION, screenItem);
		}
	}
}
