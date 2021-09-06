package Controller
{
    import fl.motion.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    dynamic public class NPC extends MovieClip
    {
        public var rootClass:MovieClip;
        private var parameters:Array;
        public var isProp:Boolean = true;
        // public var objSettings:Object;
        public var targetNPC:Object;
        public var btnButton:SimpleButton;
        public var npcDisplay:DisplayObject;

        public function NPC()
        {
            this.parameters = new Array();
            this.rootClass = MovieClip(this.stage.getChildAt(0));
            this.parameters = this.name.split("_");
            var _loc_1:* = getDefinitionByName(this.parameters[0] + "_NPC");
            this.npcDisplay = addChild(new _loc_1);
            this.npcDisplay.height = this.parameters[3];
            this.npcDisplay.width = this.parameters[4];
            this.npcDisplay.y = -75;
            this.npcDisplay.x = 10;
            setChildIndex(this.npcDisplay, 1);

            if (this.parameters[1] == "right") {
                this.npcDisplay.scaleX = this.npcDisplay.scaleX * -1;
                this.npcDisplay.x = -15;
                this.btnButton.x = this.npcDisplay.x + -10;
            }

            if (this.parameters.length >= 6) {
                this.npcDisplay.y = -parseInt(this.parameters[5]);
            }

            if (this.parameters.length >= 7) {
                this.npcDisplay.x = -parseInt(this.parameters[6]);
            }

            this.btnButton.y = this.npcDisplay.y - 75;
            buttonMode = false; // true
            this.npcDisplay.addEventListener(MouseEvent.MOUSE_OVER, this.onOver);
            this.npcDisplay.addEventListener(MouseEvent.MOUSE_OUT, this.onOut);
            this.addEventListener(MouseEvent.MOUSE_DOWN, this.onClick);
        }

        public function onClick(event: MouseEvent): void
        {
            this.rootClass.mixer.playSound("Good");
            this.rootClass.world.map.targetNPC = this.parameters[0];
            this.rootClass.world.openApop({
                npcLinkage:this.parameters[0] + "_NPC", 
                cnt:"Controller.NPC_APOP", 
                npcEntry:"left", 
                scene:this.parameters[2]
            });
        }

        public function onOver(event: MouseEvent): void
        {
            // this.color.brightness = 0.3;
            // this.npcDisplay.transform.colorTransform = this.color;
        }

        public function onOut(event: MouseEvent): void
        {
            this.color.brightness = 0;
            this.npcDisplay.transform.colorTransform = this.color;
        }
    }
}