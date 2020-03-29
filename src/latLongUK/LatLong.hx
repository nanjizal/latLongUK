package latLongUK;

@:structInit
class LatLong {
    public var lat:       Float;
    public var long:      Float;
    function new( lat: Float, long: Float ){
        this.lat       = lat;
        this.long      = long;
    }
    public static
    var zero( get, null ): LatLong;
    inline static 
    function get_zero(): LatLong {
        return { lat: 0., long: 0. };
    }
    public
    var notOrigin( get, null ): Bool;
    inline 
    function get_notOrigin(){
        return !( lat == 0. && long == 0. );
    }
    public inline
    function pretty(){
        return 'phi ' + Math.round( lat*100 )/100 + ' lambda ' + Math.round( long*100 )/100;
    }
}