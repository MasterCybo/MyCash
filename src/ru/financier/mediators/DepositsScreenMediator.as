/**
 * Created by Artem-Home on 17.03.2017.
 */
package ru.financier.mediators
{
	import feathers.controls.Button;
	
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	import ru.financier.data.IDeposit;
	import ru.financier.events.ScreenEvent;
	import ru.financier.managers.IDepositsManager;
	import ru.financier.views.screens.DepositsScreen;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class DepositsScreenMediator extends Mediator
	{
		public function DepositsScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			var depositsManager:IDepositsManager = getOf(IDepositsManager);
			var len:int = depositsManager.numDeposits;
			var deposit:IDeposit;
			for (var i:int = 0; i < len; i++) {
				deposit = depositsManager.getDepositAt(i);
				view.addDeposit(deposit);
			}
			
			addViewListener(Event.TRIGGERED, buttonHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(Event.TRIGGERED, buttonHandler);
			super.destroy();
		}
		
		public function get view():DepositsScreen { return _view as DepositsScreen; }
		
		private function buttonHandler(event:Event):void
		{
			var button:Button = event.target as Button;
			if (!button) return;
			
			switch (button.name) {
				case DepositsScreen.BUTTON_BACK:
					dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_PREVIOUS));
					break;
			}
		}
	}
}
