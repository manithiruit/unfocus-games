package TClone.core.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class FieldEvent extends Event
	{
		public static const LINES_COMPLETE:String = "lines complete";
		
		public var completedLines:Vector.<uint>;
		
		public function FieldEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
