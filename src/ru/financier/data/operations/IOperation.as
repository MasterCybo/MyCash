/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data.operations
{
	import ru.financier.data.IMoney;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IOperation
	{
		function apply(target:IMoney, applicable:IMoney):Boolean;
	}
}
