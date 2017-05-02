/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Tag extends Entity implements ITag
	{
		public function Tag(name:String)
		{
			super(name);
		}
		public function equals(tag:ITag):Boolean
		{
			return tag.name == name;
		}

		override public function toString():String
		{
			return name;
		}
	}
}
