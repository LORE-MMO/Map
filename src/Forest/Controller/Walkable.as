package Controller
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class Walkable extends MovieClip
    {
		public var btnWalkingArea: MovieClip;
		
        public function Walkable() 
        {
            addFrameScript(0, frame1);
        }

        function frame1() 
        {
            btnWalkingArea.addEventListener(MouseEvent.CLICK, walk);
			this.alpha = 0;
        }
		
        public function walk(event: MouseEvent) 
        {
            MovieClip(this.parent.parent).onWalkClick();
        }
    }
}
