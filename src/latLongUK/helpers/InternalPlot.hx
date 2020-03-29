package latLongUK.helpers;

@:structInit
class InternalPlot {
    public var dx:    Float;
    public var dy:    Float;
    public var scale: Float;
    public var negY:  Float;
    function new( scale: Float, dx: Float, dy: Float, negY: Float ){
        this.scale       = scale;
        this.dx          = dx;
        this.dy          = dy;
        this.negY        = negY;
    }
}
