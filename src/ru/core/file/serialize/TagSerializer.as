/**
 * Copyright (c) 2015 SmartHead. All rights reserved.
 */
package ru.core.file.serialize
{
	import ru.financier.data.ITag;
	
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class TagSerializer implements IJSONSerializer
	{
		public function TagSerializer()
		{
		}
		
		public function destroy():void
		{
		}
		
		public function deserialize(target:Object, json:String):void
		{
			var data:Object = JSON.parse(json);
			
			var tag:ITag = target as ITag;
			tag.id = data.id;
			tag.name = data.name;
		}
		
		public function serialize(object:Object):String
		{
			var tag:ITag = object as ITag;
			
			var data:Object = {
				id:tag.id,
				name:tag.name
			};
			return JSON.stringify(data);
		}
	}
}
