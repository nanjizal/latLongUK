package latLongUK.demo;
import htmlHelper.tools.DivertTrace;
import htmlHelper.canvas.CanvasWrapper;
import htmlHelper.canvas.Surface;
import uk.CanvasUK;
import js.Browser;
import latLongUK.helpers.Plotting;
import latLongUK.helpers.XY;
class Main {
    public static
    function main() new Main();
    var canvasWrapper:  CanvasWrapper;
    var surface:        Surface;
    var divertTrace:    DivertTrace;
    public
    function new(){
        divertTrace = new DivertTrace();
        canvasSetup();
        vectorUK();
        demoLatLong();
    }
    public
    function canvasSetup(){
        var canvas = new CanvasWrapper();
        canvas.width  = 1024;
        canvas.height = 768;
        Browser.document.body.appendChild( cast canvas );
        surface = new Surface({ x: 10, y: 10, me: canvas.getContext2d() });
    }
    public
    function vectorUK(){
        // likely fairly approximate
        var uk = new CanvasUK( surface );
        uk.dx = 28;
        uk.dy = 47;
        uk.alpha = 1.;
        uk.scaleY = 0.975;
        uk.scaleX = 1.04;
        uk.draw();
    }
    public 
    function demoLatLong(){
        var plot = Plotting.defaultPlot();
        var lines = plot.wideGrid();
        surface.beginFill( 0x0000ff, 0. );
        surface.lineStyle( 1., 0x0c0cf0, 0.2 );
        var no =   lines.length;
        var line:  Array<XY>;
        var len:   Int;
        var point: XY;
        for( i in 0...no ){
            line =  lines[ i ];
            len =   line.length;
            point = line[ 0 ];
            surface.moveTo( point.x, point.y );
            for( j in 1...len ){
                point = line[ j ];
                surface.lineTo( point.x, point.y );
            }
        }
        surface.endFill();
    }
}