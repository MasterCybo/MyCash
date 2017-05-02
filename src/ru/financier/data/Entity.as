/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class Entity implements IEntity
	{
		protected var _name:String;
		protected var _id:String;

		public function Entity(name:String = null)
		{
			_name = name;
		}
		
		public function get id():String { return _id; }
		public function set id(value:String):void { _id = value; }
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }
		
		public function toString():String
		{
			return this["constructor"] + ", " + _name;
		}
	}
}
