/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	import ru.financier.data.IDeposit;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface IDepositsManager
	{
		function get numDeposits():uint;

		function hasDeposit(deposit:IDeposit):Boolean;

		function getDepositAt(index:uint):IDeposit;

		function getDepositByID(id:String):IDeposit;
		
		function addDeposit(deposit:IDeposit):IDeposit;
		
		function removeDeposit(deposit:IDeposit):void;
		
		function removeAllDeposits():void;
		
		function get deposits():Vector.<IDeposit>;
	}
}
