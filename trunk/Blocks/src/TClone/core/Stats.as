package TClone.core
{
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public final class Stats 
	{
		private static var _stats:Stats = new Stats;
		public static function get stats():Stats { return _stats; }
		
		private var _I:uint = 0;
		private var _J:uint = 0;
		private var _L:uint = 0;
		private var _O:uint = 0;
		private var _S:uint = 0;
		private var _T:uint = 0;
		private var _Z:uint = 0;
		
		public function get I():uint { return _I; }
		public function get J():uint { return _J; }
		public function get L():uint { return _L; }
		public function get O():uint { return _O; }
		public function get S():uint { return _S; }
		public function get T():uint { return _T; }
		public function get Z():uint { return _Z; }
		
		internal function recordTetrad(symbol:String):uint
		{
			return this["_" + symbol]++;
		}
		
	}
}
