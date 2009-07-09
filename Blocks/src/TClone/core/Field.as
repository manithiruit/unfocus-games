package TClone.core
{
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public dynamic class Field extends Array
	{
		private var stats:Stats = Stats.stats;
		
		public function Field()
		{
			super();
			push(
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
			);
		}
		
		/**
		 * 
		 * @param	piece
		 * @return Vector.<uin> - Line numbers for completed lines.
		 */
		public function add(piece:Tetrad):Vector.<uint>
		{
			var linesFull:Vector.<Boolean> = new Vector.<Boolean>;
			var lineNumbers:Vector.<uint> = new Vector.<uint>;
			
			var blocks:Vector.<Block> = piece.blocks;
			for (var i:uint = 0, n:uint = blocks.length; i < n; i++) {
				this[uint(blocks[i].y + piece.y)][uint(blocks[i].x + piece.x)] = 1;
			}
			
			// record stats
			stats.recordTetrad(piece.name);
			
			var y:uint, x:uint, yn:uint, xn:uint;
			
			// check for lines
			for (y = 0, yn = this.length; y < yn; ++y) {
				linesFull[y] = true;
				for (x = 0, xn = this[y].length; x < xn; ++x) {
					if (this[y][x] == 0) {
						linesFull[y] = false;
						break;
					}
				}
			}
			
			for (y = 0, yn = linesFull.length; y < yn; ++y) {
				if (linesFull[y]) {
					lineNumbers.push(y);
					this.splice(y, 1);
					this.splice(0, 0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
				}
			}
			
			return lineNumbers;
		}
		
	}
}
