package TClone.ui 
{
	import flash.display.Sprite;
	import TClone.core.Field;
	import TClone.ui.Block;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class FieldSprite extends Sprite
	{
		public function FieldSprite(field:Field) 
		{
			var block:Block;
			var ni:uint, nj:uint;
			ni = field.length;
			for (var i:uint = 0; i < ni; i++)
			{
				nj = field[i].length;
				for (var j:uint = 0; j < nj; j++)
				{
					block = new Block();
					block.y = i * 20;
					block.x = j * 20;
					block.alpha = .2;
					addChild(block);
				}
			}
			
		}
		
	}
}