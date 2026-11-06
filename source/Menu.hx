package;

import flixel.FlxG; // Refer to line 34.
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxSpriteUtil;
import flixel.FlxCamera;
import flixel.group.FlxGroup.FlxTypedGroup; // For menu buttons.;
import flixel.util.FlxColor;
import flixel.graphics.FlxGraphic;
import openfl.geom.Point;
import JsonMacro;
import flixel.graphics.frames.FlxAtlasFrames; // for animated sprites

// Some imports here may be unused, as this is deriative of one or two source projects of mine.

using flixel.util.FlxSpriteUtil;

class Menu  extends FlxState
{
	//var parsedFile = haxe.Json.parse(sys.io.File.getContent('assets/data/spawn.json'));
		var parsedFile = JsonMacro.load(('assets/data/spawn.json'));
	var pathSponge:String = "assets/images/";

	var base_holder:FlxSprite;
		var funny_A:FlxSprite;
		var funny_B:FlxSprite;

		var mask:FlxSprite;


	override public function create()
	{
		super.create();
		FlxG.camera.bgColor = 0xFF005D00;

		/*base_holder = new FlxSprite();
		base_holder.loadGraphic(pathSponge + "base.png");
		//base_holder.screenCenter();
		////add(base_holder);
		//base_holder.makeGraphic(122, 91, FlxColor.PURPLE, true);
        base_holder.x = 50;
        base_holder.y = 100;
        base_holder.cameras = [FlxG.camera];
        add(base_holder);*/


        var menuEntries:Array<Dynamic> = parsedFile.sprites;
        var spriteCollection:FlxTypedGroup<FlxSprite>;

        spriteCollection = new FlxTypedGroup<FlxSprite>();
		 add(spriteCollection); // Must be created before the code below! Otherwise it will be shown as an invalid access point.

        //menuEntries is an array, the variable of "i" simply goes through it, I think it can be any other letter as well?

		trace("Full array: " + menuEntries + "\n\n");

		for (i in menuEntries){
			funny_A = new FlxSprite();
			//funny_A.loadGraphic("assets/images/num1.png");
			funny_A.loadGraphic(i.graphic);
				// Built in FlxSprite features
					if (i.x != null) funny_A.x = i.x;
					// Basically, checks if the json has an X value for this sprite, and if it does, then it sets the X value. Otherwise it's automatically set to 0. Works similarly for other lines in this code.
					if (i.y != null) funny_A.y = i.y;
					if (i.flipX != null) funny_A.flipX = i.flipX;
					if (i.flipY != null) funny_A.flipY = i.flipY;

				// Optional Features Here
				if (i.sparrow == true){ // If the JSON has a value called sparrow (bool). Also supports xml (string)
					// http://api.haxeflixel.com/flixel/graphics/frames/FlxAtlasFrames.html
					// In this implementation, if there is no "xml" value, then it assumes the "graphic" value does not have the  file extension and thus uses that to grab both a png and xml with the filename!
					if (i.xml != null){	funny_A.frames = FlxAtlasFrames.fromSparrow(i.graphic, i.xml);}
					else{ 	funny_A.frames = FlxAtlasFrames.fromSparrow("${i.graphic}.png", "${i.graphic}.xml");}
				}

				funny_A.updateHitbox();
			spriteCollection.add(funny_A);
			trace("Array [i]: " + i.graphic);
		}
		// https://try.haxe.org/#76598A8f // ME
		// https://try.haxe.org/#068Cf7CA // SEMMI ADJUSTMENT, DANKE
		// So basically, instead of me trying to do "menuEntries[i].value" I needed to do "i.value" which makes a lot more sense now!

		 for (entrie in menuEntries) trace(entrie.flipX);


	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);



	}
}
