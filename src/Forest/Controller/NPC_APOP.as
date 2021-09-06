package Controller
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    dynamic public class NPC_APOP extends MovieClip
    {
        /**
         * This is where you can add your NPC(s).
         *
         * @var array
         */
		public var NPCS: Object = {
            // NPC Zueira
            Zueira:{
				Dialogue:{
					Name:"Zueira",
					Subtitle:"Princess",
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
						Value:"1,2,3"
                    }]
				}
			},

            // NPC Risky
            Risky: {
                Dialogue:{
				    Name:"Risky",
					Subtitle:"test",
					Context:[
						"test"
					]
				}
            }
        };

        public function NPC_APOP()
        {
            addFrameScript(0, this.frame1);
        }

        public function frame1()
        {
            this.rootClass = MovieClip(stage.getChildAt(0));
            this.objSettings = this.NPCS[this.rootClass.world.map.targetNPC].Dialogue;
            this.setupVisibility();
            this.createTexts();
            this.createButtons();
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
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            this.rootClass.mixer.playSound("Click");
            switch(event.currentTarget.name) {
                case "btnButton0":
                    _loc_2 = event.currentTarget.name.replace("btnButton", "");
                    _loc_3 = this.objSettings.Buttons[_loc_2].Action;
                    switch(_loc_3) {
                        case "Shop":
                            this.rootClass.world.sendLoadShopRequest(this.objSettings.Buttons[_loc_2].Value);
                            break;
                        case "Quest":
                            this.rootClass.world.showQuests(this.objSettings.Buttons[_loc_2].Value, "q");
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
