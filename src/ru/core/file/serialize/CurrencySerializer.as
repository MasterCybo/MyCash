/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.serialize
{
	import ru.financier.data.ICurrency;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class CurrencySerializer implements IJSONSerializer
	{
		public function CurrencySerializer()
		{
			super();
		}
		
		public function destroy():void
		{
		}
		
		public function deserialize(target:Object, json:String):void
		{
			var data:Object = JSON.parse(json);
			
			var currency:ICurrency = target as ICurrency;
			currency.id = data.id;
			currency.name = data.name;
			currency.symbol = data.symbol;
		}
		
		public function serialize(object:Object):String
		{
			var currency:ICurrency = object as ICurrency;
			var data:Object = {
				id:currency.id,
				name:currency.name,
				symbol:currency.symbol
			};
			return JSON.stringify(data);
		}
	}
}
