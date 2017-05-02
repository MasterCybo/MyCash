/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data
{
	import ru.financier.data.collections.ITagList;
	import ru.financier.data.operations.IOperation;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ITransaction extends IEntity
	{
		function make():Boolean;

		function get tags():ITagList;

		function get operation():IOperation;
		function set operation(value:IOperation):void;

		function get deposit():IDeposit;
		function set deposit(value:IDeposit):void;

		function get money():IMoney;
		function get state():IStateTransaction;
	}
}
