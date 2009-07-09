package TClone.ui 
{
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class Block extends Shape
	{
		public function Block()
		{
			draw();
		}
		
		public function draw():void
		{
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(1, 1, 18, 18);
			graphics.endFill();
		}
		
	}
}
