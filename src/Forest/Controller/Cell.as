package Controller
{
    import flash.display.*;

    dynamic public class Cell extends MovieClip
    {
        private var parameters: Array;
        public var intScale: Number;
        public var intSpeed: int;
        public var strMode: String;

        public function Cell() 
        {
            addFrameScript(0, frame1, 1, frame2);
        }

        function frame1() 
        {
            visible = false;
        }

        function frame2() 
        {
            this.parameters = this.name.split("_");
            this.strMode = this.parameters[0].toLowerCase();
            this.intSpeed = this.parameters[1];
            this.intScale = parseInt(this.parameters[2]) / 10;

            MovieClip(parent).stop();
            MovieClip(parent.parent).cellSetup(this.intScale, this.intSpeed, this.strMode);
            stop();
        }
    }
}
