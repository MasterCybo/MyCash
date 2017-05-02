/**
 * Created by Artem-Home on 17.03.2017.
 */
package ru.financier.views.screens
{
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	
	import ru.core.views.controls.BubblingButton;
	
	import ru.financier.data.IDeposit;
	import ru.financier.views.components.DepositItemListRenderer;
	
	import starling.text.TextFormat;
	
	public class DepositsScreen extends Screen
	{
		public static const BUTTON_BACK:String = "buttonBack";
		
		private var _depositList:ListCollection;
		
		public function DepositsScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var layoutScreen:VerticalLayout = new VerticalLayout();
			layout = layoutScreen;
			
			
			var back:BubblingButton = new BubblingButton();
			back.name = BUTTON_BACK;
			back.label = "<";
			
			var title:Label = new Label();
			title.fontStyles = new TextFormat("Arial", 40, 0xFFFFFF);
			title.text = "Счета";
			
			var headerLayout:HorizontalLayout = new HorizontalLayout();
			headerLayout.gap = 10;
			headerLayout.verticalAlign = VerticalAlign.MIDDLE;
			
			var headerGroup:LayoutGroup = new LayoutGroup();
			headerGroup.layout = headerLayout;
			headerGroup.addChild(back);
			headerGroup.addChild(title);
			
			
			_depositList = new ListCollection();
			
			
			var list:List = new List();
			list.scrollBarDisplayMode = ScrollBarDisplayMode.FIXED;
			list.verticalScrollPolicy = ScrollPolicy.AUTO;
			list.layoutData = new VerticalLayoutData(100, 100);
			list.itemRendererType = DepositItemListRenderer;
			list.dataProvider = _depositList;
			
			
			addChild(headerGroup);
			addChild(list);
		}
		
		public function addDeposit(deposit:IDeposit):void
		{
			_depositList.addItem(deposit);
		}
	}
}
