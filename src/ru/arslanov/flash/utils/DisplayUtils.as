package ru.arslanov.flash.utils {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class DisplayUtils {
		
		private static var _point:Point = new Point();
		
		static public function toTopDepth( object:DisplayObject ):int {
			var parent:DisplayObjectContainer = object.parent;
			var depth:int = parent.getChildIndex( object );
			
			parent.setChildIndex( object, parent.numChildren - 1 );
			
			return depth;
		}
		
		public static function transposeTo( object:DisplayObject, targetContainer:DisplayObjectContainer ):void
		{
			if ( !object.parent ) throw new ReferenceError( "Target no parent!" );
			_point.setTo( object.x, object.y );
			_point = targetContainer.globalToLocal( object.parent.localToGlobal( _point ) );
			object.x = _point.x;
			object.y = _point.y;
			targetContainer.addChild( object );
		}
	}

}