/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.data.collections
{
	import ru.financier.data.ITag;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public interface ITagList
	{
		function get numTags():uint;
		
		function hasTag(tag:ITag):Boolean;
		
		function getTagAt(index:uint):ITag;
		
		function addTag(tag:ITag):ITag;
		
		function removeTag(tag:ITag):ITag;
		
		function removeAllTags():void;
	}
}
