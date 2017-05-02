/**
 * Created by Artem-Home on 18.03.2017.
 */
package ru.financier.views.components
{
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	
	import flash.events.TimerEvent;
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	import flash.globalization.LocaleID;
	import flash.utils.Timer;
	
	import ru.financier.assets.EmbededFonts;
	import ru.financier.data.IMoney;
	
	import starling.text.TextFormat;
	
	public class BalancePane extends LayoutGroup
	{
		public static const FORMATTER_DATE:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT, DateTimeStyle.MEDIUM, DateTimeStyle.SHORT);
		public static const FORMAT_CASH:TextFormat = new TextFormat(EmbededFonts.ROBOTO_CONDENSED_LIGHT, 50, 0xFFFFFF);
		public static const FORMAT_SUM:TextFormat = new TextFormat(EmbededFonts.ROBOTO_THIN, 30, 0xFFFFFF);
		
		private var _cash:Label;
		private var _date:Label;
		private var _dateUpdateTimer:Timer = new Timer(3000);
		
		public function BalancePane()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var layoutPane:VerticalLayout = new VerticalLayout();
			layoutPane.gap = 10;
			layout = layoutPane;
			
			
			var title:Label = new Label();
			title.text = "Всего";
			
			_date = new Label();
			
			var layoutHeader:HorizontalLayout = new HorizontalLayout();
			layoutHeader.verticalAlign = VerticalAlign.BOTTOM;
			var groupHeader:LayoutGroup = new LayoutGroup();
			groupHeader.layout = layoutHeader;
			groupHeader.addChild(title);
			groupHeader.addChild(_date);
			
			
			var sum:Label = new Label();
			sum.fontStyles = FORMAT_SUM;
			sum.text = "Σ";
			
			_cash = new Label();
			_cash.fontStyles = FORMAT_CASH;
			_cash.text = "" + 0;
		
			var layoutCash:HorizontalLayout = new HorizontalLayout();
			layoutCash.gap = 10;
			layoutCash.verticalAlign = VerticalAlign.BOTTOM;
			var groupCash:LayoutGroup = new LayoutGroup();
			groupCash.layout = layoutCash;
			groupCash.addChild(sum);
			groupCash.addChild(_cash);
			
			addChild(groupHeader);
			addChild(groupCash);
			
			_dateUpdateTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			_dateUpdateTimer.start();
			timerHandler();
		}
		
		override public function dispose():void
		{
			_dateUpdateTimer.stop();
			_dateUpdateTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
			super.dispose();
		}
		
		public function set totalCash(value:IMoney):void
		{
			_cash.text = value.toShortFormat();
		}
		
		private function timerHandler(event:TimerEvent = null):void
		{
			updateDate(new Date());
		}
		
		private function updateDate(value:Date):void
		{
			_date.text = FORMATTER_DATE.format(value);
		}
	}
}
