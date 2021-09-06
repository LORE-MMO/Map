package  
{
	import Controller.*;
	import flash.display.*;
    import flash.events.*;
	import flash.media.*;
	
	dynamic public class Flow extends MovieClip 
	{
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

		internal function Wait()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdd, false, 0, true);
			// addEventListener(Event.REMOVED_FROM_STAGE, onRemove, false, 0, true);
			stop();
		}

		internal function Blank()
        {
            if (parent == stage) {
                return;
            }
            var local1:* = MovieClip(parent);
            trace("[Agathosune] (SCOPE): " + local1.name);
            trace("[Agathosune] (VARIABLES): " + local1.strFrame);
            gotoAndPlay(local1.strFrame);
		}
		
		internal function Enter()
        {
            stop();
        }
		
		internal function Room1()
        {
            stop();
        }

		internal function Room2()
        {
            stop();
        }

		internal function Room3()
        {
            stop();
        }

		public function onAdd(event: Event): void
        {
            this.rootClass = MovieClip(this.stage.getChildAt(0));
        }

		public function onRemove(event: Event): void 
		{
			SoundMixer.stopAll();
		}
	}
}
