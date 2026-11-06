package;

import flixel.FlxGame;
import openfl.display.Sprite;
/*#if hxWindowColorMode
import hxwindowmode.WindowColorMode;
import openfl.Lib;
#end*/
import openfl.Lib;
class Main extends Sprite
{
	public function new()
	{
		super();
		#if debug
			var icon = lime.graphics.Image.fromBitmapData("assets/system/app_icon_dark.png");
			Lib.current.stage.window.setIcon(icon);
		#end
		addChild(new FlxGame(0, 0, Menu));
	}
}
