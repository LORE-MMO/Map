package  
{
	import Controller.*;
	import flash.display.*;
    import flash.events.*;
	
	dynamic public class Flow extends MovieClip 
	{
		// public var Normal_8_10: Cell;

		// public var StercoreCell: MovieClip;

		// public var StercoreNavigation1: MovieClip;

		// public var StercoreNavigation2: MovieClip;

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
            var _loc_1:* = MovieClip(parent);
            trace("[Agathosune] (SCOPE): " + _loc_1.name);
            trace("[Agathosune] (VARIABLES): " + _loc_1.strFrame);
            gotoAndPlay(_loc_1.strFrame);
		}
        
		
		internal function Enter()
        {
			// ZueiraStercoreCell();
			// ZueiraStercoreNavigation1();
            stop();
        }
		
		internal function Room1()
        {
			// ZueiraStercoreCell();
			// ZueiraStercoreNavigation2();
            stop();
        }

		internal function Room2()
        {
			// ZueiraStercoreCell();
            stop();
        }

		internal function Room3()
        {
			// ZueiraStercoreCell();
            stop();
        }

		public function onAdd(event: Event): void
        {
            this.rootClass = MovieClip(this.stage.getChildAt(0));
        }

		// function ZueiraStercoreCell() {
		// 	switch (currentLabel) {
		// 		case "Enter":
		// 			StercoreCell.intScale = 1.0;
		// 			StercoreCell.intSpeed = 8;
		// 			StercoreCell.strMode = "normal";
		// 			break;
		// 		case "Room1":
		// 			StercoreCell.intScale = 1.0;
		// 			StercoreCell.intSpeed = 8;
		// 			StercoreCell.strMode = "normal";
		// 			break;
		// 		case "Room2":
		// 			StercoreCell.intScale = 1.0;
		// 			StercoreCell.intSpeed = 8;
		// 			StercoreCell.strMode = "normal";
		// 			break;
		// 		case "Room3":
		// 			StercoreCell.intScale = 3;
		// 			StercoreCell.intSpeed = 15;
		// 			StercoreCell.strMode = "solo";
		// 			break;
		// 	}
		// }

		// function ZueiraStercoreNavigation1() {
		// 	StercoreNavigation1.tCell = "Room1";
		// 	StercoreNavigation1.tPad = "Left";
		// }

		// function ZueiraStercoreNavigation2() {
		// 	StercoreNavigation2.tCell = "Enter";
		// 	StercoreNavigation2.tPad = "Right";
		// }
	}
}
