package TClone.ui 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import TClone.core.events.TetradEvent;
	import TClone.core.Tetrad;
	import TClone.ui.Block;
	
	import gs.TweenLite;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class TetradSprite extends Sprite
	{
		private var blocks:Vector.<Block>;
		public function getBlocks():Vector.<Block> { return blocks; }
		
		private var tetrad:Tetrad;
		public function getTetrad():Tetrad { return tetrad; };
		
		private var holder:Sprite;
		
		private var blockSize:Number;
		
		public function TetradSprite(aTetrad:Tetrad, aBlockSize:Number = 20) 
		{
			blockSize = aBlockSize;
			
			tetrad = aTetrad;
			
			holder = new Sprite;
			
			var n:uint = tetrad.blocks.length;
			blocks = new Vector.<Block>(n, true);
			var block:Block;
			for (var i:uint = 0; i < n; i++)
			{
				block = new Block();
				block.y = tetrad.blocks[i].y * blockSize - 10;// :TODO: detect the center
				block.x = tetrad.blocks[i].x * blockSize - 10;
				blocks[i] = block;
				holder.addChild(block);
			}
			holder.y = 10;
			holder.x = 10;
			addChild(holder);
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xFF0000);
			shape.graphics.drawRect(-1, -1, 2, 2);
			shape.graphics.endFill();
			holder.addChild(shape);
			
		}
		
		public function onMove(evt:TetradEvent):void
		{
			var tetrad:Tetrad = evt.tetrad;
			TweenLite.to(this, .1, { y: blockSize * tetrad.y, x: blockSize * tetrad.x } );
		}
		
		public function rotateCW():void
		{
			TweenLite.to(holder, .1, { rotation: 90 * tetrad.rotationsIndex } );
		}
		
		// :TODO:
		//public function getAdjustedBlocksPos() {}
		
	}
	
}
