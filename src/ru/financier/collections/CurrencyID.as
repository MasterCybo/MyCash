/**
 * Created by Artem-Home on 18.03.2017.
 */
package ru.financier.collections
{
	import ru.arslanov.core.enum.EnumUint;
	
	public class CurrencyID extends EnumUint
	{
		public static const RUB:CurrencyID = new CurrencyID(1);
		public static const USD:CurrencyID = new CurrencyID(2);
		
		public function CurrencyID(val:uint = undefined)
		{
			super(val);
		}
		
		public function get id():String
		{
			return getUint().toString();
		}
	}
}
