package TClone.core
{
	import TClone.core.Block;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class Tetrad
	{
		public var x:int = 4;
		public var y:int = 0;
		
		internal var width:uint;
		internal var height:uint;
		
		public var name:String;
		
		public var blocks:Vector.<Block>;
		
		internal var rotations:Vector.<Vector.<Block>> = Vector.<Vector.<Block>>([]);
		public var rotationsIndex:uint = 0;
		
		public function moveRight(field:Field):Boolean
		{
			x++;
			if (testMove(field)) {
				// move successful
				return true;
			} else {
				x--;
				return false;
			}
		}
		
		public function moveLeft(field:Field):Boolean
		{
			x--;
			if (testMove(field)) {
				// move successful
				return true;
			} else {
				x++;
				return false;
			}
		}
		
		private function testMove(field:Field):Boolean
		{
			// check for field bounds
			var blockY:Number;
			var blockX:Number;
			var fhn:Number = field.length - 1;
			var fwn:Number = field[0].length - 1;
			for each (var block:Block in blocks) {
				blockY = block.y + y;
				blockX = block.x + x;
				if (blockY > fhn || blockX < 0 || blockX > fwn || !field[blockY] || !field[blockX] || field[blockY][blockX]) {
					// move no good
					return false;
				}
			}
			
			return true;
		}
		
		public function moveDown(field:Field):Boolean
		{
			y++;
			if (testMove(field)) {
				return true;
			}
			else {
				y--;
				return false;
			}
		}
		
		public function rotateCW(field:Field):Boolean
		{
			var tempIndex:uint = rotationsIndex + 1;
			if (tempIndex >= rotations.length) {
				tempIndex = 0;
			}
			if (tempIndex == rotationsIndex) {
				return false;
			}
			
			blocks = rotations[tempIndex];
			
			// pivot the width and height
			var oldWidth:uint = width;
			var oldHeight:uint = height;
			width = oldHeight;
			height = oldWidth;
			
			if (testMove(field)) {
				rotationsIndex = tempIndex;
				return true;
			}
			else {
				height = oldHeight;
				width = oldWidth;
				blocks = rotations[rotationsIndex];
				return false;
			}
		}
		
		public function rotateCCW(field:Field):Boolean
		{
			
			return true;
		}
		
		public function addToField(field:Field):Boolean
		{
			blocks = rotations[0];
			return testMove(field);
		}
		
	}
}
