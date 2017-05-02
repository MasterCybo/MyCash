/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.financier.managers
{
	import ru.financier.data.ITag;

	import flash.utils.Dictionary;


	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class TagsManager implements ITagsManager
	{
		private var _tags:Vector.<ITag> = new Vector.<ITag>();
		private var _mapTags:Dictionary = new Dictionary();
		private var _numTags:uint;

		public function TagsManager()
		{
		}

		public function get numTags():uint { return _numTags; }

		public function hasTag(tag:ITag):Boolean { return _mapTags[tag.id] != undefined; }

		public function getTagAt(index:uint):ITag
		{
			if (index < 0 || index >= _numTags) return null;
			return _tags[index];
		}

		public function getTagByID(id:String):ITag { return _mapTags[id]; }

		public function addTag(tag:ITag):ITag
		{
			if (hasTag(tag)) return null;
			_tags.push(tag);
			tag.id = String(_tags.length);
			_mapTags[tag.id] = tag;
			_numTags++;
			return tag;
		}

		public function removeTag(tag:ITag):void
		{
			if (!hasTag(tag)) return;
			var idx:int = _tags.indexOf(tag);
			if (idx != -1) {
				_tags.splice(idx, 1);
				delete _tags[tag.id];
				tag.id = null;
				_numTags--;
			}
		}

		public function removeAllTags():void
		{
			_tags = new Vector.<ITag>();
			_mapTags = new Dictionary();
			_numTags = 0;
		}

		public function toString():String
		{
			return "" + _tags;
		}
	}
}
