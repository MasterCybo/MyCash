/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.serialize
{
	import ru.financier.data.ITransaction;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class TransactionSerializer implements IJSONSerializer
	{
		public function TransactionSerializer()
		{
		}
		
		public function destroy():void
		{
		}
		
		public function deserialize(target:Object, json:String):void
		{
			var data:Object = JSON.parse(json);
			
			var transaction:ITransaction = target as ITransaction;
			transaction.
		}
		
		public function serialize(object:Object):String
		{
			return "";
		}
	}
}
