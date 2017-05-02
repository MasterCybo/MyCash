/**
 * Created by Artem-Home on 19.03.2017.
 */
package ru.core.views.renderers
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	
	import starling.events.Event;
	
	public class AppItemListRenderer extends Button implements IListItemRenderer
	{
		private var _data:Object;
		private var _selected:Boolean;
		private var _index:int;
		private var _owner:List;
		private var _factoryID:String;
		
		public function AppItemListRenderer()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
		}
		
		override public function dispose():void
		{
			super.dispose();
			_data = null;
			_owner = null;
		}
		
		override protected function draw():void
		{
			super.draw();
			var dataInvalid:Boolean = isInvalid(INVALIDATION_FLAG_DATA);
			if (dataInvalid) applyData();
		}
		
		protected function applyData():void
		{
			// override me
		}
		
		public function get isSelected():Boolean { return _selected; }
		public function set isSelected(value:Boolean):void
		{
			if (value == _selected) return;
			_selected = value;
			invalidate(INVALIDATION_FLAG_SELECTED);
			dispatchEventWith(Event.CHANGE);
		}
		
		public function get data():Object { return _data; }
		public function set data(value:Object):void
		{
			if (value == _data) return;
			_data = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get index():int { return _index; }
		public function set index(value:int):void
		{
			if (value == _index) return;
			_index = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get owner():List { return _owner; }
		public function set owner(value:List):void
		{
			if (value == _owner) return;
			_owner = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get factoryID():String { return _factoryID; }
		public function set factoryID(value:String):void { _factoryID = value; }
	}
}
