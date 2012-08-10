package alphatab.rendering.glyphs;
import alphatab.model.Clef;
import alphatab.platform.ICanvas;
import alphatab.platform.model.Color;

class ClefGlyph extends SvgGlyph
{
	public function new(x:Int = 0, y:Int = 0, clef:Clef)
	{
		super(x, y, getClefSvg(clef), 1, 1);
	}	
	
		
	public override function doLayout():Void 
	{
		width = Std.int(28 * getScale());
	}
	
	public override function canScale():Bool 
    {
        return false;
    }
	
	private function getClefSvg(clef:Clef) : String
	{
		switch(clef)
		{
			case C3: return MusicFont.ClefC; 
			case C4: return MusicFont.ClefC;
			case F4: return MusicFont.ClefF;
			case G2: return MusicFont.ClefG;
			default: return "";
		}
	}
}