package  
{
	import Controller.*;
	import flash.display.*;
    import flash.events.*;
	
	dynamic public class Flow extends MovieClip 
	{
		public var Normal_8_10: Cell;

		public function Flow() 
		{
			addFrameScript(
				0, Wait, 
				1, Blank, 
				2, Enter, 
				3, Room1, 
				4, Room2, 
				5, Room3
			);
		}

		function Wait() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdd, false, 0, true);
			// addEventListener(Event.REMOVED_FROM_STAGE, onRemove, false, 0, true);
			stop();
		}

		function Blank()
        {
            if (parent == stage) return;
            var map:* = MovieClip(parent);
            trace("[Agathosune] (SCOPE): " + map.name);
            trace("[Agathosune] (VARIABLES):   " + map.strFrame);
            gotoAndPlay(map.strFrame);
		}
        
		
		function Enter()
        {
            stop();
        }
		
		function Room1()
        {
            stop();
        }

		function Room2()
        {
            stop();
        }

		function Room3()
        {
            stop();
        }

		public function onAdd(event: Event): void
        {
            this.rootClass = MovieClip(this.stage.getChildAt(0));
        }
	}
}
