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
	public class TagList implements ITagList
	{
		private var _tags:Vector.<ITag> = new Vector.<ITag>();
		private var _numTags:uint = 0;

		public function TagList()
		{
		}

		public function get numTags():uint { return _numTags; }

		public function hasTag(tag:ITag):Boolean
		{
			return _tags.indexOf(tag) != -1;
		}

		public function getTagAt(index:uint):ITag
		{
			if (index < 0 || index >= numTags) return null;
			return _tags[index];
		}

		public function addTag(tag:ITag):ITag
		{
			_tags.push(tag);
			_numTags++;
			return tag;
		}

		public function removeTag(tag:ITag):ITag
		{
			var idx:int = _tags.indexOf(tag);
			if (idx == -1) return null;
			_tags.splice(idx, 1);
			_numTags--;
			return tag;
		}

		public function removeAllTags():void
		{
			_tags = new Vector.<ITag>();
			_numTags = 0;
		}

		public function toString():String
		{
			return "" + _tags;
		}
	}
}
