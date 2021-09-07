package Controller
{
	import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.*;
    import flash.display.*;

    public dynamic class Aggresive extends MovieClip 
    {
        public var rootClass:*;
        // public var rootClass:Object;

        public function Aggresive()
        {
            addFrameScript(0, frame1);
        }

        public function onEnter(event: Event): void
        {
            var Monster:* = undefined;
            var isAggresive:* = true;
            var MonsterMapID:* = 0;
            var AggresiveMonsters:* = new Array();
            if (this.strMonsters.length > 0) {
                while ((((MonsterMapID < this.strMonsters.length)) && (isAggresive))) {
                    Monster = rootClass.world.getMonster(this.strMonsters[MonsterMapID]);
                    if (Monster.pMC == null) {
                        isAggresive = false;
                    };

                    AggresiveMonsters[MonsterMapID] = this.strMonsters[MonsterMapID];
                    MonsterMapID = (MonsterMapID + 1);
                };

                if (isAggresive) {
                    rootClass.world.aggroMons(AggresiveMonsters);
                    removeEventListener(Event.ENTER_FRAME, onEnter);
                };
            } else {
                trace("Monsters haven't been selected");
            };
        }

        function frame1()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            addEventListener(Event.ENTER_FRAME, onEnter, false, 0, true);
			visible = false;
        }

    }
}
