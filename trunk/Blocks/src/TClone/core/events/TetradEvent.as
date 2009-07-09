package TClone.core.events 
{
	import flash.events.Event;
	import TClone.core.Tetrad;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class TetradEvent extends Event
	{
		public static const ADDED:String = "tetrad_added";
		public static const LANDED:String = "tetrad_complete";
		
		public static const MOVED_DOWN:String = "tetrad_moved_down";
		public static const MOVED_LEFT:String = "tetrad_moved_left";
		public static const MOVED_RIGHT:String = "tetrad_moved_right";
		
		public static const ROTATED_CW:String = "tetrad_rotated";
		public static const ROTATED_CCW:String = "tetrad_rotated";
		
		public var tetrad:Tetrad;
		
		public function TetradEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
