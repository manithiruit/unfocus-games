package TClone.ui.ascii
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.ByteArray;
	
	import TClone.core.Block;
	import TClone.core.Field;
	import TClone.core.Game;
	import TClone.core.Stats;
	import TClone.core.Tetrad;
	
	import flash.events.Event;
	
	//import leskinen.LinearBlurFilter;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class AsciiGame extends Sprite
	{
		//private var linearBlurFilter:LinearBlurFilter;
		private var game:Game;
		
		// stage elements
		private var fieldDisp:TextField;
		private var nextDisp:TextField;
		private var statsDisp:TextField;
		
		private var traceBox:TextField;
		
		public function AsciiGame( aGame:Game = null ) 
		{
			game = aGame;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			/*var lineEquation:Array = [0.707,-0.707,-6.0];
            var uScale:Number = 10.0;
            var vScale:Number = 5.0;
            var quality:int = 3;
			
			linearBlurFilter = new LinearBlurFilter(
				lineEquation,
				uScale,
				vScale,
				quality
			);
			
			filters = linearBlurFilter.filters;*/
			
			fieldDisp = new TextField;
			fieldDisp.y = 20;
			fieldDisp.x = 20;
			fieldDisp.autoSize = TextFieldAutoSize.LEFT;
			addChild(fieldDisp);
			
			nextDisp = new TextField;
			nextDisp.y = 20;
			nextDisp.x = 140;
			nextDisp.autoSize = TextFieldAutoSize.LEFT;
			addChild(nextDisp);
			
			statsDisp = new TextField;
			statsDisp.y = 90;
			statsDisp.x = 140;
			statsDisp.autoSize = TextFieldAutoSize.LEFT;
			addChild(statsDisp);
			
			traceBox = new TextField;
			traceBox.y = 160;
			traceBox.x = 140;
			nextDisp.autoSize = TextFieldAutoSize.LEFT;
			addChild(traceBox);
			
			if (!game) {
				game = new Game(stage);
				game.start();
			}
			
			// :NOTE: this is a temparary brute force draw
			addEventListener(Event.ENTER_FRAME, draw);
		}
		
		private function trace(val:*):void {
			traceBox.appendText(val.toString() + "\n");
		}
		
		private function draw(evt:Event):void
		{
			var line:Array;
			
			var field:Field = game.getField();
			var currentTetrad:Tetrad = game.getCurrentTetrad();
			var nextTetrad:Tetrad = game.getNextTetrad();
			var stats:Stats = game.getStats();
			
			var copier:ByteArray = new ByteArray();
			copier.writeObject(field);
			copier.position = 0;
			var displayField:* = copier.readObject();
			
			for each (var block:* in currentTetrad.blocks) {
				if (displayField[int(currentTetrad.y + block.y)])
					displayField[int(currentTetrad.y + block.y)][int(currentTetrad.x + block.x)] = 1;
			}
			
			fieldDisp.text = "";
			
			for each (line in displayField) {
				fieldDisp.appendText(line.join(" ").replace(/0/g, "_").replace(/1/g, "*") + "\n");
			}
			
			nextDisp.text = "";
			for each (line in nextTetrad.blocks) {
				nextDisp.appendText(line.join(" ") + "\n");
			}
			
			statsDisp.text = "";
			statsDisp.appendText("I : " + stats.I + "\n");
			statsDisp.appendText("J : " + stats.J + "\n");
			statsDisp.appendText("L : " + stats.L + "\n");
			statsDisp.appendText("O : " + stats.O + "\n");
			statsDisp.appendText("S : " + stats.S + "\n");
			statsDisp.appendText("T : " + stats.T + "\n");
			statsDisp.appendText("Z : " + stats.Z + "\n");
		}
		
	}
}
