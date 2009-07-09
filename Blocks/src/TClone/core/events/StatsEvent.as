package TClone.core.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class StatsEvent extends Event
	{
		
		public function StatsEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
