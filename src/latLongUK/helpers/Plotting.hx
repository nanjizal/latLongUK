package latLongUK.helpers;
import latLongUK.LatLong;
abstract Plotting( InternalPlot ) to InternalPlot from InternalPlot {
    public inline
    function new( ip: InternalPlot ){
        this = ip;
    }
    public static inline
    function defaultPlot(){
        return new Plotting({ scale: 1/2000, dx: 53., dy: 60., negY: 500  });
    }
    public inline
    function toXY( ll: LatLong ): XY {
        var sp: Spheroid = ll;
        var flat: Flat = sp;
        return oStoXY( flat );
    }
    public inline
    function oStoXY( flat: Flat ): XY {
        return { x: flat.east * this.scale +  this.dx
               , y: this.negY - flat.north * this.scale + this.dy };
    }
    public inline
    function wideGrid( minLat: Int  = 49
                     , maxLat: Int  = 60
                     , minLong: Int = -9
                     , maxLong: Int = 2 ):Array<Array<XY>> {
        var arr = new Array<Array<XY>>();
        var count = 0;
        var tempCount = 0;
        for( lat in minLat...maxLat ){
            if( (lat+1)%2 == 0 ) continue;
            var temp = new Array<XY>();
            tempCount = 1;
            temp[0] = toXY( { lat: lat, long: minLong } );
            for( long in minLong...maxLong ){
                temp[ tempCount++ ] = toXY( { lat: lat, long: long } );
                temp[ tempCount++ ] = toXY( { lat: lat, long: long + 0.25 } );
                temp[ tempCount++ ] = toXY( { lat: lat, long: long + 0.5  } );
                temp[ tempCount++ ] = toXY( { lat: lat, long: long + 0.75 } );
            }
            temp[ tempCount++ ] = toXY( { lat: lat, long: maxLong + 1, } );
            arr[ count++ ] = temp;
        }
        for( long in minLong...maxLong+2 ){
            if( (long+1)%2 == 0 ) continue;
            var temp = new Array<XY>();
            tempCount = 1;
            temp[0] = toXY( { lat: minLat, long: long } );
            for( lat in minLat...maxLat ){
                temp[ tempCount++ ] = toXY( { lat: lat, long: long } );
            }
            arr[ count++ ] = temp;
        }
        return arr;
    }
    public inline
    function fineGrid( minLat: Int  = 49
                     , maxLat: Int  = 60
                     , minLong: Int = -9
                     , maxLong: Int = 2 ):Array<Array<XY>> {
        var arr = new Array<Array<XY>>();
        var count = 0;
        var tempCount = 0;
        for( lat in minLat...maxLat ){
            var temp = new Array<XY>();
            tempCount = 1;
            temp[0] = toXY( { lat: lat, long: minLong } );
            for( long in minLong...maxLong ){
                temp[ tempCount++ ] = toXY( { lat: lat, long: long } );
            }
            arr[ count++ ] = temp;
        }
        for( long in minLong...maxLong ){
            var temp = new Array<XY>();
            tempCount = 1;
            temp[0] = toXY( { lat: minLat, long: long } );
            for( lat in minLat...maxLat ){
                temp[ tempCount++ ] = toXY( { lat: lat, long: long } );
            }
            arr[ count++ ] = temp;
        }
        return arr;
    }
}