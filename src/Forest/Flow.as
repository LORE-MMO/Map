package  
{
	import Controller.*;
	import flash.display.*;
    import flash.events.*;
	import flash.media.*;

	dynamic public class Flow extends MovieClip 
	{
		public var rootClass:MovieClip;
		public var sessionNames: Array;
        public var sessionQty: Array;
		public var questVal: int;
		public var mapInfo: Object;

        public var NPCS: Object = {
            Eson:{
				Dialogue:{
					Name:"Eson",
					Subtitle:"The Celestial",
					Context:[
						"test"
					],
                    Buttons:[{
						Name:"Starter Shop", 
						Action:"Shop", 
						Value:1
					}, {
                        Name:"Quest", 
						Action:"Quest", 
						Value:"1,2,3,4"
                    }]
				}
			}
        };

		public function Flow() 
		{
			addFrameScript(
				0, Wait, 
				1, Blank, 
				2, Enter, 
				3, Room1, 
				4, Room2, 
				5, Room3,
				6, Cut1
			);
		}

		internal function Wait()
		{
			sessionNames = new Array("SeenIt");
			sessionQty = new Array(1);
			addEventListener(Event.ADDED_TO_STAGE, onAdd, false, 0, true);
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

        internal function Cut1()
        {
            rootClass.hideInterface();
            stop();
        }

		public function onAdd(event: Event): void
        {
            this.rootClass = MovieClip(this.stage.getChildAt(0));
			questVal = rootClass.world.getQuestValue(1);
			mapInfo = rootClass.world.initMap();
			mapInfo.initObjSess(sessionNames, sessionQty);
        }

		public function onRem(event: Event): void 
		{
			SoundMixer.stopAll();
		}

		public function eventTrigger(o: Object): void
		{
			switch(o.cmd) {
				case "userLoaded":
					questVal = this.rootClass.world.getQuestValue(1);
					trace("questVal: " + questVal);
					if (questVal < 2) {
						trace("seenIt: " + mapInfo.checkSess("seenIt"));
						if (!mapInfo.checkSess("seenIt")) {
							mapInfo.updateSessArray("seenIt");
							rootClass.world.moveToCell("Cut1", "Left");
						}
					}
					break;
			}
		}
	}
}
