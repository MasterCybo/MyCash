/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class StateTransaction extends Entity implements IStateTransaction
	{
		public static const COMPLETED:String = "completedState"; // завершенный
		public static const PLANNED:String = "plannedState"; // отложенный, запланированный
		public static const EDITED:String = "edited"; // в состоянии создания/редактирования

		private var _date:Date = new Date();

		public function StateTransaction(name:String)
		{
			super(name);
		}

		public function get date():Date { return _date; }

		public function toString():String
		{
			return name + " " + date;
		}
	}
}
