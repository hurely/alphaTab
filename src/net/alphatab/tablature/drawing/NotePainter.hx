package net.alphatab.tablature.drawing;
import net.alphatab.model.BeatStrokeDirection;
import net.alphatab.model.Duration;
import net.alphatab.model.Point;
import net.alphatab.model.PointF;
import net.alphatab.tablature.ViewLayout;

/**
 * This painter draws musical notes and beams. 
 */
class NotePainter 
{
	public static function paintFooter(layer:DrawingLayer, x:Int, y:Int, dur:Int, dir:Int, layout:ViewLayout) : Void
	{
		var scale = layout.scale;
		if (dir == -1)
		{
			x += DrawingResources.getScoreNoteSize(layout, false).width;
		}
		var s:String = "";
            switch (dur)
            { 
                case Duration.SIXTY_FOURTH:
                    s = (dir == -1) ? MusicFont.FooterUpSixtyFourth : MusicFont.FooterDownSixtyFourth;
                case Duration.THIRTY_SECOND:
                    s = (dir == -1) ? MusicFont.FooterUpThirtySecond : MusicFont.FooterDownThirtySecond;
                case Duration.SIXTEENTH:
                    s = (dir == -1) ? MusicFont.FooterUpSixteenth :  MusicFont.FooterDownSixteenth;
                case Duration.EIGHTH:
                    s = (dir == -1) ? MusicFont.FooterUpEighth :  MusicFont.FooterDownEighth;
            }
            if (s != "")
				layer.addMusicSymbol(s, x, y, scale);

	}
	public static function paintBar(layer:DrawingLayer, x1:Int, y1:Int, x2:Int, y2:Int, count:Int, dir:Int, scale:Float ) : Void
	{
		var width:Float = Math.max(1.0, Math.round(3.0 * scale));
		for (i in 0 ... count) {
			var realY1:Float = (y1 - ((i * (5.0 * scale)) * dir));
			var realY2:Float = (y2 - ((i * (5.0 * scale)) * dir));
			
			layer.startFigure();
			layer.addPolygon([new PointF(x1, realY1), new PointF(x2, realY2), 
								new PointF(x2, realY2 + width), 
								new PointF(x1, realY1 + width), new PointF(x1, realY1), ]);
			layer.closeFigure();
		}
	}
	
	public static function paintHarmonic(layer:DrawingLayer, x:Int, y:Int, scale:Float)
	{
		layer.addMusicSymbol(MusicFont.Harmonic, x, y, scale);
	}
	
	public static function paintNote(layer:DrawingLayer, x:Int, y:Int, scale:Float, full:Bool, font:String)
	{
		var symbol = full ? MusicFont.NoteQuarter : MusicFont.NoteHalf;
		layer.addMusicSymbol(symbol, x, y, scale);
	}
	
	public static function paintDeadNote(layer:DrawingLayer, x:Int, y:Int, scale:Float, font:String)
	{
		layer.addMusicSymbol(MusicFont.DeadNote, x, y, scale);
	}	
}