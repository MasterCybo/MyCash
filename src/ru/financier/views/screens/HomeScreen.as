/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.views.screens
{
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import ru.core.views.controls.BubblingButton;
	import ru.financier.views.components.BalancePane;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class HomeScreen extends Screen
	{
		public static const BUTTON_GAIN:String = "buttonGain";
		public static const BUTTON_WASTE:String = "buttonWaste";

		private var _txtSumDeposit:Label;
		
		private var _listDeposits:List;
		private var _collectionDeposits:ListCollection;

		public function HomeScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_collectionDeposits = new ListCollection();
			
			_listDeposits = new List();
			_listDeposits.dataProvider = _collectionDeposits;
			
			
			var hLayout:HorizontalLayout = new HorizontalLayout();
			hLayout.gap = 10;
			
			var hGroup:LayoutGroup = new LayoutGroup();
			hGroup.layout = hLayout;
			
			var btnGain:BubblingButton = new BubblingButton();
			btnGain.name = BUTTON_GAIN;
			btnGain.label = "Доход";
			
			var btnWaste:BubblingButton = new BubblingButton();
			btnWaste.name = BUTTON_WASTE;
			btnWaste.label = "Расход";
			
			hGroup.addChild(btnGain);
			hGroup.addChild(btnWaste);
			
			
			
			var vLayout:VerticalLayout = new VerticalLayout();
			vLayout.gap = 10;
			
			var vertGroup:LayoutGroup = new LayoutGroup();
			vertGroup.layout = vLayout;
			
			
			var total:BalancePane = new BalancePane();
			
			vertGroup.addChild(total);
//			vertGroup.addChild(_listDeposits);
//			vertGroup.addChild(hGroup);
			
			
			addChild(vertGroup);
		}
		
		public function setDepositTotal(amount:Number, currency:String = ""):void
		{
			_txtSumDeposit.text = amount + " " + currency;
		}
		
		public function displayDeposite(title:String, amount:Number, currency:String):void
		{
			_collectionDeposits.push(
					{
						label:title + " - " + amount + " " + currency
					}
			);
		}
	}
}
