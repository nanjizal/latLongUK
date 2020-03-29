package latLongUK.helpers;
import latLongUK.EastNorth;
import latLongUK.LatLongUK;
@:forward
abstract Flat( EastNorth ) to EastNorth from EastNorth {
    public inline
    function new( en: EastNorth ){
        this = en;
    }
    @:from
    public static inline
    function fromSpheroid( ll: Spheroid ) {
        var en = LatLongUK.ll_to_osOld( ll );
        return new Flat( en );
    }
    @:to
    public inline
    function toSpheroid() {
        var ll = LatLongUK.os_to_llOld( this );
        return new Spheroid( ll );
    }
}