package Controller
{
    import flash.display.*;

    dynamic public class Monster extends MovieClip
    {
        public var isMonster:Boolean = true;
        public var MonMapID:int;
        public var strDir:String;
        private var parameters:Array;

        public function Monster()
        {
            this.parameters = this.name.split("_");
            this.strDir = this.parameters[0].toLowerCase();
            this.MonMapID = this.parameters[1];
            this.alpha = 0;
        }
    }
}
