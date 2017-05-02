/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data.operations
{
	import ru.financier.data.*;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class SubOperation extends Operation
	{
		public function SubOperation()
		{
			super();
		}
		
		override public function apply(target:IMoney, source:IMoney):Boolean
		{
			target.amount -= source.amount;
			return true;
		}
	}
}
