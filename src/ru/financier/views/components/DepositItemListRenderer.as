/**
 * Created by Artem-Home on 19.03.2017.
 */
package ru.financier.views.components
{
	import ru.core.views.renderers.AppItemListRenderer;
	import ru.financier.data.IDeposit;
	
	public class DepositItemListRenderer extends AppItemListRenderer
	{
		public function DepositItemListRenderer()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			height = 50;
		}
		
		override protected function applyData():void
		{
			if (deposit) {
				label = deposit.toString();
			}
		}
		
		private function get deposit():IDeposit { return data as IDeposit; }
	}
}
