package latLongUK.helpers;

@:structInit
class XY {
    public var x:          Float;
    public var y:          Float;
    public
    function new( x: Float, y: Float ){
        this.x       = x;
        this.y       = y;
    }
    public inline
    function pretty(){
        return 'x ' + x + ' y ' + y;
    }
}