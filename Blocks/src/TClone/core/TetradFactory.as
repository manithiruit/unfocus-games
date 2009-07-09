package TClone.core
{
	import TClone.core.Block;
	
	/**
	 * ...
	 * @author Kevin Newman <Kevin@unFocus.com>
	 */
	public class TetradFactory
	{
		internal static var stats:Stats = new Stats;
		public static function getStats():Stats
		{
			return stats;
		}
		
		private static const factories:Vector.<Function> = Vector.<Function>(
			[
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (2, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 4;
					tetrad.height = 1;
					
					//
					// xxXx
					//
					//
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-2,0);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(1,0);
					rotations[0] = blocks;
					
					//   x
					//   x
					//   X
					//   x
					blocks = new Vector.<Block>(4, true);
					blocks[3] = new Block(0,-2);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(0,1);
					rotations[1] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "I";
					
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (4, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 3;
					tetrad.height = 2;
					
					//
					// xXx
					//   x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,0);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(1,0);
					blocks[3] = new Block(1,1);
					rotations[0] = blocks;
					
					//  x
					//  X
					// xx
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(-1,1);
					blocks[3] = new Block(0,1);
					rotations[1] = blocks;
					
					// x
					// xXx
					//
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,-1);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(1,0);
					rotations[2] = blocks;
					
					//  xs
					//  X
					//  x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(1,-1);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(0,1);
					rotations[3] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "J";
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (4, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 3;
					tetrad.height = 2;
					
					//
					// xXx
					// x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,0);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(1,0);
					blocks[3] = new Block(-1,1);
					rotations[0] = blocks;
					
					// xx
					//  X
					//  x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,-1);
					blocks[1] = new Block(0,-1);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(0,1);
					rotations[1] = blocks;
					
					//   x
					// xXx
					//
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(1,-1);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(1,0);
					rotations[2] = blocks;

					//  x
					//  X
					//  xx
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(0,1);
					blocks[3] = new Block(1,1);
					rotations[3] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "L";
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (2, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 3;
					tetrad.height = 2;
					
					//  xx
					// xX
					//
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(1,-1);
					blocks[2] = new Block(-1,0);
					blocks[3] = new Block(0,0);
					rotations[0] = blocks;
					
					//  x
					//  Xx
					//   x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(1,0);
					blocks[3] = new Block(1,1);
					rotations[1] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "S";
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (1, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 2;
					tetrad.height = 2;
					
					// xx
					// xx
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,0);
					blocks[1] = new Block(1,0);
					blocks[2] = new Block(0,1);
					blocks[3] = new Block(1,1);
					rotations[0] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "O";
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (4, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 3;
					tetrad.height = 2;
					
					//
					// xXx
					//  x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,0);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(1,0);
					blocks[3] = new Block(0,1);
					rotations[0] = blocks;
					
					//  x
					// xX
					//  x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(0,1);
					rotations[1] = blocks;
					
					//  x
					// xXx
					//
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(1,0);
					rotations[2] = blocks;
					
					//  x
					//  Xx
					//  x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(1,0);
					blocks[3] = new Block(0,1);
					rotations[3] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "T";
					return tetrad;
				},
				function():Tetrad
				{
					var tetrad:Tetrad = new Tetrad();
					
					var rotations:Vector.<Vector.<Block>> = new Vector.<Vector.<Block>> (2, true);
					var blocks:Vector.<Block>;
					
					tetrad.width = 3;
					tetrad.height = 2;
					
					//
					// xX
					//  xx
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(-1,0);
					blocks[1] = new Block(0,0);
					blocks[2] = new Block(0,1);
					blocks[3] = new Block(1, 1);
					rotations[0] = blocks;
					
					//  x
					// xX
					// x
					blocks = new Vector.<Block>(4, true);
					blocks[0] = new Block(0,-1);
					blocks[1] = new Block(-1,0);
					blocks[2] = new Block(0,0);
					blocks[3] = new Block(-1,1);
					rotations[1] = blocks;
					
					tetrad.rotations = rotations;
					tetrad.name = "Z";
					return tetrad;
				}
			]
		);
		
		public static function getRandomTetrad():Tetrad
		{
			return factories[Math.floor(Math.random() * factories.length)]();
		}
		
	}
}
