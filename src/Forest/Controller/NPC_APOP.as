package Controller
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    dynamic public class NPC_APOP extends MovieClip
    {
        public function NPC_APOP()
        {
            addFrameScript(
                0, Wait,
                1, Init
            );
        }

        public function Wait()
        {
            this.rootClass = MovieClip(stage.getChildAt(0));
            this.objSettings = this.rootClass.world.map.NPCS[this.rootClass.world.map.targetNPC].Dialogue;
        }

        public function Init()
        {
            // this.rootClass = MovieClip(stage.getChildAt(0));
            // this.objSettings = this.rootClass.world.map.NPCS[this.rootClass.world.map.targetNPC].Dialogue;
            this.setupVisibility();
            this.createTexts();
            this.createButtons();
            stop();
        }

        public function setupVisibility()
        {
            var _loc_1:* = 0;
            while (_loc_1 < 3) {
                this["btnButton" + _loc_1].visible = false;
                _loc_1 = _loc_1 + 1;
            }
        }

        public function createTexts()
        {
            this.txtName.text = this.objSettings.Name;
            this.txtSubtitle.text = this.objSettings.Subtitle;
            this.txtContext.text = this.objSettings.Context;
        }

        public function createButtons()
        {
            var _loc_2:* = null;
            var _loc_1:* = 0;
            while (_loc_1 < this.objSettings.Buttons.length) {
                this["btnButton" + _loc_1].visible = true;
                this["btnButton" + _loc_1].txtTitle.mouseEnabled = false;
                this["btnButton" + _loc_1].txtTitle.htmlText = this.objSettings.Buttons[_loc_1].Name;
                this["btnButton" + _loc_1].addEventListener(MouseEvent.CLICK, this.onClickGeneral);
                _loc_1 = _loc_1 + 1;
            }
        }

        public function onClickGeneral(event: MouseEvent): void
        {
            var Button:* = undefined;
            var Action:* = undefined;
            var Value:* = undefined;
            this.rootClass.mixer.playSound("Click");
            switch(event.currentTarget.name) {
                case "btnButton0":
                case "btnButton1":
                case "btnButton2":
                    Button = event.currentTarget.name.replace("btnButton", "");
                    Action = this.objSettings.Buttons[Button].Action;
                    Value = this.objSettings.Buttons[Button].Value;
                    switch(Action) {
                        case "Shop":
                            this.rootClass.world.sendLoadShopRequest(Value);
                            break;
                        case "Quest":
                            this.rootClass.world.showQuests(Value, "q");
                            break;
                        case "Auction":
                            this.rootClass.toggleAuction();
                            break;
                        case "Bank":
                            this.rootClass.world.toggleBank();
                            break;
                        case "Guild":
                            this.rootClass.world.showGuildList();
                            break;
                        case "Space":
                            this.rootClass.world.loadMovieFront(this.rootClass.bagSpace, "Inline Asset");
                            break;
                        case "Navigation":
                            rootClass.world.moveToCell(Value.Cell, Value.Pad);
                            break;
                        case "Navigator":
                            rootClass.world.gotoTown(Value.Town, Value.Cell, Value.Pad);
                            break;
                        default:
                            break;
                    }
                    break;
                default:
                    break;
            }
        }

        public var btnButton0:MovieClip;
        public var txtContext:TextField;
        public var txtName:TextField;
        public var txtSubtitle:TextField;
        public var rootClass:MovieClip;
        public var objSettings:Object;
        public var dialogueIndex:int = 0;
    }
}
