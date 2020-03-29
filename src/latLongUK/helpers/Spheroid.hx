package latLongUK.helpers;
import latLongUK.LatLong;
import latLongUK.LatLongUK;
@:forward
abstract Spheroid( LatLong ) to LatLong from LatLong {
    public inline
    function new( ll: LatLong ){
        this = ll;
    }
    @:from
    public static inline
    function fromFlat( flat: Flat ): Spheroid {
      var ll = LatLongUK.os_to_llOld( flat );
      return new Spheroid( ll );
    }
    @:to
    public inline
    function toFlat(): Flat {
      var en = LatLongUK.ll_to_osOld( this );
      return new Flat( en );
    }
}