package Controller
{
    import flash.display.*;

    dynamic public class Cell extends MovieClip
    {
        private var parameters:Array;
        public var intScale:Number;
        public var intSpeed:int;
        public var strMode:String;

        public function Cell()
        {
            this.alpha = 0;
            var _loc_1:* = MovieClip(parent);
            if (_loc_1.parent == stage) {
                return;
            }
            var _loc_2:* = MovieClip(parent.parent);
            this.parameters = this.name.split("_");
            this.strMode = this.parameters[0].toLowerCase();
            this.intScale = parseInt(this.parameters[1]) / 10;
            this.intSpeed = this.parameters[2];
            _loc_1.stop();
            _loc_2.cellSetup(this.intScale, this.intSpeed, this.strMode);
        }
    }
}
