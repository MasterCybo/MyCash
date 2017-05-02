/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.collections
{
	import ru.arslanov.core.enum.Enum;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class EnumScreenType extends Enum
	{
		public function EnumScreenType(val:Class)
		{
			super(val);
		}

		public function getClass():Class { return value; }
	}
}
