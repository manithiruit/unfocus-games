package TClone.core
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.ui.Keyboard;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import flash.utils.ByteArray;
	
	import TClone.core.events.*;
	
	/**
	 * ...
	 * @author Kevin Newman
	 */
	public class Game extends EventDispatcher
	{
		protected var field:Field;
		public function getField():Field { return field; }
		
		protected var stats:Stats = Stats.stats;
		public function getStats():Stats { return stats; }
		
		protected var currentTetrad:Tetrad;
		public function getCurrentTetrad():Tetrad { return currentTetrad; }
		
		protected var nextTetrad:Tetrad;
		public function getNextTetrad():Tetrad { return nextTetrad; }
		
		private var frameCount:Number = 0;
		
		private var stage:Stage;
		
		// interface modifiers (delayed key repeat, stuff like that)
		private var moveLeft:Boolean = false;
		private var moveLeftC:uint = 0;
		private var moveRight:Boolean = false;
		private var moveRightC:uint = 0;
		private var moveDown:Boolean = false;
		private var moveDownC:uint = 0;
		private var rotateCW:Boolean = false;
		private var rotateCWC:uint = 0;
		
		public function Game(aStage:Stage)
		{
			stage = aStage;
		}
		
		public function start():void
		{
			field = new Field;
			
			currentTetrad = getRandomTetrad();
			nextTetrad = getRandomTetrad();
			
			dispatchEvent(new GameEvent(GameEvent.GAME_START));
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			currentTetrad.addToField(field)
			dispatchEvent(new TetradEvent(TetradEvent.ADDED));
		}
		
		private function getRandomTetrad():Tetrad {
			return TetradFactory.getRandomTetrad();
		}
		
		private function loop(evt:Event):void
		{
			var y:int, x:int, yn:int, xn:int;
			
			var tetradEvent:TetradEvent;
			
			frameCount++;
			
			// check input
			if (rotateCW) {
				if (rotateCWC > 4 || rotateCWC == 0) {
					if (currentTetrad.rotateCW(field)) {
						tetradEvent = new TetradEvent(TetradEvent.ROTATED_CW);
						tetradEvent.tetrad = currentTetrad;
						dispatchEvent(tetradEvent);
					}
				}
				++rotateCWC;
			}
			
			if (moveRight) {
				if (moveRightC > 4 || moveRightC == 0) {
					if (currentTetrad.moveRight(field))
						dispatchEvent(new TetradEvent(TetradEvent.MOVED_RIGHT));
				}
				++moveRightC;
			}
			
			if (moveLeft) {
				if (moveLeftC > 4 || moveLeftC == 0) {
					if (currentTetrad.moveLeft(field))
						dispatchEvent(new TetradEvent(TetradEvent.MOVED_LEFT));
				}
				++moveLeftC;
			}
			
			if (moveDown || frameCount > 29)
			{
				if (!currentTetrad.moveDown(field))
				{
					var completedLines:Vector.<uint> = field.add(currentTetrad);
					
					dispatchEvent(new TetradEvent(TetradEvent.LANDED));
					
					if (completedLines.length) {
						var fieldEvt:FieldEvent = new FieldEvent(FieldEvent.LINES_COMPLETE);
						fieldEvt.completedLines = completedLines;
						dispatchEvent(fieldEvt);
					}
					
					nextTetrad.addToField(field);
					
					currentTetrad = nextTetrad;
					nextTetrad = getRandomTetrad();
					
					dispatchEvent(new TetradEvent(TetradEvent.ADDED));
				}
				
				dispatchEvent(new TetradEvent(TetradEvent.MOVED_DOWN));
				
				if (frameCount > 29)
					frameCount = 0;
			}
			
			// :TODO: create validation framework for redraw
			// or Timer / update based events
			//draw();
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode) {
				case Keyboard.LEFT:
					moveLeft = true;
					break;
				case Keyboard.RIGHT:
					moveRight = true;
					break;
				case Keyboard.DOWN:
					moveDown = true;
					break;
				case Keyboard.UP:
					rotateCW = true;
					break;
			}
		}
		private function onKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode) {
				case Keyboard.LEFT:
					moveLeft = false;
					moveLeftC = 0;
					break;
				case Keyboard.RIGHT:
					moveRight = false;
					moveRightC = 0;
					break;
				case Keyboard.DOWN:
					moveDown = false;
					//moveDownC = 0;
					break;
				case Keyboard.UP:
					rotateCW = false;
					rotateCWC = 0;
					break;
			}
		}
		
		private function gameOver():void
		{
			// display game over
			removeEventListener(Event.ENTER_FRAME, loop);
			dispatchEvent(new GameEvent(GameEvent.GAME_OVER));
			
			//traceBox.text = "Game Over";
		}
		
		/*
		 * StatsUpdate
		 * ScoreUpdate
		 * GameOver
		 * GameStart
		 * 
		 * FieldUpdate (meta)
		 * TetradAdded
		 * TetradMove
		 * TetradRotate
		 * LinesRemoved
		 */
		
	}
}
