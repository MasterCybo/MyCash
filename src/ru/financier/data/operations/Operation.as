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
	public class Operation implements IOperation
	{
		public function Operation()
		{
		}
		
		public function apply(target:IMoney, source:IMoney):Boolean
		{
			return false;
		}
	}
}
