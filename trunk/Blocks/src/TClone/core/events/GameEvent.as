package TClone.core.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class GameEvent extends Event
	{
		public static const GAME_START:String = "start";
		public static const GAME_OVER:String = "over";
		
		public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
