package Intro
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.media.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;

    dynamic public class IntroInit extends MovieClip
    {
        public var rootClass: MovieClip;
        public var mcClickArea: MovieClip;
        public var txtInit: TextField;
        public var playerName: String;

        public function IntroInit()
        {
            rootClass = MovieClip(stage.getChildAt(0));
            // if (rootClass.world.getQuestValue(1) < 1) {
            //     rootClass.world.moveToCell("Room1", "Left");
            // }
            // rootClass.hideInterface();
            // mcClickArea.addEventListener(MouseEvent.CLICK, onMouseClickArea);
            addFrameScript(
                0,  Intro1,
                9,  Intro2,
                19, Intro3,
                29, Intro4,
                39, Intro5,
                49, Blank
            );
        }

        public function onMousePlay(event: MouseEvent): void
        {
            // nextFrame();
            play();
            // if (mcClickArea.hitTestPoint(event.stageX, event.stageY)) {
			// 	play();
            // };
        }

        public function onMouseNext(event: MouseEvent): void
        {
            nextFrame();
            // play();
            // if (mcClickArea.hitTestPoint(event.stageX, event.stageY)) {
			// 	play();
            // };
        }

        internal function Intro1()
        {
            // mcClickArea.addEventListener(MouseEvent.CLICK, onMouseClickArea);
            rootClass.stage.addEventListener(MouseEvent.CLICK, onMousePlay);
            stop();
        }

        internal function Init1()
        {
            stop();
        }

        internal function Intro2()
        {
            stop();
        }

        internal function Intro3()
        {
            stop();
        }

        internal function Intro4()
        {
            stop();
        }

        internal function Intro5()
        {
            stop();
        }

        // internal function Intro6()
        // {
        //     rootClass.stage.removeEventListener(MouseEvent.CLICK, onMousePlay);
        //     rootClass.stage.addEventListener(MouseEvent.CLICK, onMouseNext);

        //     playerName = rootClass.world.myAvatar.objData.strUsername;
        //     txtInit.text = "Hey " + playerName + ", Are you alright?";
        //     stop();
        // }

        // internal function Intro7()
        // {
        //     txtInit.text = "Do you still remember me? i'm Eson";
        //     stop();
        // }

        // internal function Intro8()
        // {
        //     txtInit.text = "luckily you didn't lose all your memories, we have arrived at Annwn";
        //     stop();
        // }

        // internal function Intro9()
        // {
        //     txtInit.text = "You still remember what they ordered you, right? now we're in human form, but maybe with the current strength it's still enough to protect yourself.";
        //     stop();
        // }

        // internal function Intro10()
        // {
        //     txtInit.text = "You can leave now, but remember this world is not the same as in the celestial, and your life could be in danger. be careful when you meet the Zeniths.";
        //     // rootClass.sfc.sendXtMessage("zm", "acceptQuest", [1], "str", -1);
        //     // rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [1, -1, false, "wvz"], "str", -1);
        //     stop();
        // }

        // internal function Intro11()
        // {
        //     txtInit.text = "I heard you can look for your needs such as food and others in the city, don't worry I will always keep an eye on you. I have given you a friend who will always be by your side and help you. I will go to do my duty, Take care of yourself-";
        //     stop();
        // }

        internal function Blank()
        {
            rootClass.showInterface();
            // rootClass.world.acceptQuest(1);
            
            rootClass.world.moveToCell("Enter", "Spawn");
            stop();
        }
    }
}
