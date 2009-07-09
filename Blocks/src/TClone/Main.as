package TClone 
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.sampler.NewObjectSample;
	import TClone.core.events.FieldEvent;
	import TClone.ui.Block;
	import TClone.ui.FieldSprite;
	import TClone.ui.TetradSprite;
	
	import TClone.core.Field;
	import TClone.core.Game;
	import TClone.core.Stats;
	import TClone.core.Tetrad;
	import TClone.core.events.GameEvent;
	import TClone.core.events.TetradEvent;
	
	import TClone.ui.ascii.AsciiGame;
	
	import flash.events.Event;
	
	import gs.TweenLite;
	
	[SWF(width = "800", height = "600", backgroundColor = "#333333", framerate = "30")]
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class Main extends Sprite
	{
		private const DUR:Number = .3;
		
		private const blockSize:Number = 20;
		
		private var game:Game;
		
		private var curTetSprite:TetradSprite;
		private var fieldSprite:FieldSprite;
		
		private var fallenBlocks:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>>(20);
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			game = new Game(stage);
			
			game.addEventListener(GameEvent.GAME_START, onGameStart);
			game.addEventListener(GameEvent.GAME_OVER, onGameOver);
			
			game.addEventListener(TetradEvent.ADDED, onTetradAdded);
			game.addEventListener(TetradEvent.LANDED, onTetradLanded);
			
			game.addEventListener(TetradEvent.MOVED_DOWN, onTetradMove);
			game.addEventListener(TetradEvent.MOVED_RIGHT, onTetradMove);
			game.addEventListener(TetradEvent.MOVED_LEFT, onTetradMove);
			
			game.addEventListener(TetradEvent.ROTATED_CW, onTetradRotate);
			game.addEventListener(TetradEvent.ROTATED_CCW, onTetradRotate);
			
			game.addEventListener(FieldEvent.LINES_COMPLETE, onLinesComplete);
			
			game.start();
			
			var ascii:AsciiGame = new AsciiGame(game);
			ascii.x = 400;
			ascii.y = 20;
			ascii.alpha = 0;
			addChild(ascii);
			TweenLite.to(ascii, DUR, { alpha: 1, tint: 0xFFFFFF } );
		}
		
		private function onGameStart(evt:GameEvent):void 
		{
			fieldSprite = new FieldSprite(game.getField());
			fieldSprite.alpha = 0;
			fieldSprite.x = 20;
			fieldSprite.y = 20;
			addChild(fieldSprite);
			
			fallenBlocks[0] = new Vector.<Block>(10, true);
			fallenBlocks[1] = new Vector.<Block>(10, true);
			fallenBlocks[2] = new Vector.<Block>(10, true);
			fallenBlocks[3] = new Vector.<Block>(10, true);
			fallenBlocks[4] = new Vector.<Block>(10, true);
			fallenBlocks[5] = new Vector.<Block>(10, true);
			fallenBlocks[6] = new Vector.<Block>(10, true);
			fallenBlocks[7] = new Vector.<Block>(10, true);
			fallenBlocks[8] = new Vector.<Block>(10, true);
			fallenBlocks[9] = new Vector.<Block>(10, true);
			fallenBlocks[10] = new Vector.<Block>(10, true);
			fallenBlocks[11] = new Vector.<Block>(10, true);
			fallenBlocks[12] = new Vector.<Block>(10, true);
			fallenBlocks[13] = new Vector.<Block>(10, true);
			fallenBlocks[14] = new Vector.<Block>(10, true);
			fallenBlocks[15] = new Vector.<Block>(10, true);
			fallenBlocks[16] = new Vector.<Block>(10, true);
			fallenBlocks[17] = new Vector.<Block>(10, true);
			fallenBlocks[18] = new Vector.<Block>(10, true);
			fallenBlocks[19] = new Vector.<Block>(10, true);
			
			TweenLite.to(fieldSprite, DUR, { alpha: 1 } );
		}
		
		private function onGameOver(evt:GameEvent):void 
		{
			trace('game over');
			
			// :TODO: set up the game stage
		}
		
		private function onTetradLanded(evt:TetradEvent):void
		{
			var fallenLineIndex:uint;
			var fallenColumnIndex:uint;
			var tetrad:Tetrad = curTetSprite.getTetrad();
			var n:uint = tetrad.blocks.length;
			var block:Block;
			for (var i:uint = 0; i < n; i++)
			{
				block = new Block();
				//blocks[i] = block;
				block.y = curTetSprite.y + tetrad.blocks[i].y * blockSize;
				block.x = curTetSprite.x + tetrad.blocks[i].x * blockSize;
				
				fallenLineIndex = tetrad.y + tetrad.blocks[i].y;
				fallenColumnIndex = tetrad.x + tetrad.blocks[i].x;
				
				if (!fallenBlocks[fallenLineIndex])
					fallenBlocks[fallenLineIndex] = new Vector.<Block>(10, true);
				
				fallenBlocks[fallenLineIndex][fallenColumnIndex] = block;
				fieldSprite.addChild(block)
			}
			
			fieldSprite.removeChild(curTetSprite);
		}
		
		private function onTetradAdded(evt:TetradEvent):void
		{
			var tetrad:Tetrad = game.getCurrentTetrad();
			curTetSprite = new TetradSprite(tetrad, blockSize);
			curTetSprite.y = blockSize * tetrad.y;
			curTetSprite.x = blockSize * tetrad.x;
			curTetSprite.alpha = 0;
			fieldSprite.addChild(curTetSprite);
			TweenLite.to(curTetSprite, DUR, { alpha: 1 } );
		}
		
		private function onTetradMove(evt:TetradEvent):void
		{
			var tetrad:Tetrad = game.getCurrentTetrad();
			//TweenLite.to(curTetSprite, .1, { y: blockSize * tetrad.y, x: blockSize * tetrad.x } );
			curTetSprite.y = blockSize * tetrad.y;
			curTetSprite.x = blockSize * tetrad.x;
		}
		
		private function onTetradRotate(evt:TetradEvent):void
		{
			switch (evt.type) {
				case TetradEvent.ROTATED_CW:
					curTetSprite.rotateCW();
					onTetradMove(evt);
					break;
			}
		}
		
		private function onLinesComplete(evt:FieldEvent):void
		{
			var lines:Vector.<uint> = evt.completedLines;
			var blocks:Vector.<Block>;
			
			var targetY:Number;
			
			// loop lines and remove complete lines
			// also animate all blocks which should fall
			var i:uint, j:uint;
			var n:uint = fallenBlocks.length;
			var nj:uint = lines.length;
			
			var targetAlpha:Number;
			trace(lines);
			for (i = 0; i < n; ++i)
			{
				if (fallenBlocks[i])
				{
					blocks = fallenBlocks[i];
					targetAlpha = 1;
					
					nj = lines.length;
					targetY = i * blockSize + (blockSize * nj);
					
					for (j = 0; j < nj; j++)
					{
						if (lines[j] && lines[j] == i)
						{
							// remove line from fallenBlocks Vector
							fallenBlocks.splice(i, 1);
							fallenBlocks.splice(0, 0, new Vector.<Block>(10, true));
							
							// adjust stepSize
							//targetY = i * blockSize;
							
							lines.splice(j, 1);
							
							// fade out and move down// move down
							targetAlpha = 0;
							
							break;
						}
					}
					
					if (targetY > 0)
					{
						nj = blocks.length;
						// move down
						for (j = 0; j < nj; ++j)
						{
							if (blocks[j])
							{
								TweenLite.to(
									blocks[j], DUR,
									{
										y: targetY,
										autoAlpha: targetAlpha,
										onComplete: removeBlock,
										onCompleteParams: [blocks[j]]
									}
								);
							}
						}
					}
					
				}
			}
			
			// adjust lines above
			/*lines.reverse();
			for (i = 0; i < n; ++i)
			{
				lineNumber = lines[i];
				blocks = fallenBlocks[lineNumber];
				nj = blocks.length;
				
				for (j = 0; j < nj; ++j)
				{
					TweenLite.to(blocks[j], DUR * i, { y: blocks[j].y + (blockSize * i) } );
				}
			}
			*/
		}
		
		private function removeBlock(aBlock:Block):void
		{
			//fieldSprite.removeChild(aBlock);
		}
		
	}
}
