package Controller
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class Navigator extends MovieClip
    {
        public var rootClass:MovieClip;
        public var shadow:MovieClip;
        public var isEvent:Boolean = true;
        private var parameters:Array;
        public var strNewMap:String;
        public var strSpawnCell:String;
        public var strSpawnPad:String;

        public function Navigator()
        {
            this.visible = false;
            addEventListener("enter", this.onEnter);
        }
        public function onEnter(event: Event)
        {
            this.parameters = this.name.split("_");
            this.strNewMap = this.parameters[0];
            this.strSpawnCell = this.parameters[1];
            this.strSpawnPad = this.parameters[2];
            this.rootClass = MovieClip(stage.getChildAt(0));
            this.rootClass.showConfirmtaionBox("Would you like to go to " + this.strNewMap + "?", this.done);
        }

        public function done(param1: Boolean): void
        {
            if (param1) {
                this.rootClass.world.gotoTown(this.strNewMap, this.strSpawnCell, this.strSpawnPad);
            }
        }
    }
}
