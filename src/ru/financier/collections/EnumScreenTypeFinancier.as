/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.collections
{
	import ru.core.collections.EnumScreenType;
	import ru.financier.views.screens.HomeScreen;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class EnumScreenTypeFinancier extends EnumScreenType
	{
		public static const MAIN_SCREEN:EnumScreenTypeFinancier = new EnumScreenTypeFinancier(HomeScreen);

		public function EnumScreenTypeFinancier(val:Class)
		{
			super(val);
		}
	}
}
