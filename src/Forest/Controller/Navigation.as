package Controller
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class Navigation extends MovieClip
    {
        public var shadow:MovieClip;
        public var isEvent:Boolean = true;
        private var parameters:Array;
        public var tPad:String;
        public var tCell:String;
        public var rPad:String = "";
        public var rCell:String = "";

        public function Navigation()
        {
            this.visible = false;
            addEventListener("enter", this.onEnter);
        }

        public function onEnter(event:Event)
        {
            this.parameters = this.name.split("_");
            this.tCell = this.rCell == "" ? (this.parameters[0]) : (this.rCell);
            this.tPad = this.rPad == "" ? (this.parameters[1]) : (this.rPad);
            MovieClip(parent.parent).moveToCell(this.tCell, this.tPad);
        }
    }
}
