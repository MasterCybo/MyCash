/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	import ru.financier.data.ITag;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ITagsManager
	{
		function get numTags():uint;

		function hasTag(tag:ITag):Boolean;
		
		function getTagAt(index:uint):ITag;

		function getTagByID(id:String):ITag;

		function addTag(tag:ITag):ITag;
		
		function removeTag(tag:ITag):void;

		function removeAllTags():void;
	}
}
