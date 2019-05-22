package;

import openfl.display.Sprite;
import openfl.events.Event;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextAlign;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

private class SubState extends FlxSubState
{

	public function new(title:String, info:String, graphic_path:String, back_color:Int):Void
	{
		super();
		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, back_color);
		var t:FlxText = new FlxText(10, 10, FlxG.width - 10, title, 48, true);
		t.alignment = CENTER;
		t.color = FlxColor.WHITE;
		var i:FlxText = new FlxText(10, FlxG.height - 50, FlxG.width - 10, info, 24, true);
		i.alignment = CENTER;
		i.color = FlxColor.WHITE;
		var sp:FlxSprite = new FlxSprite(0, 0, graphic_path);
		sp.screenCenter(FlxAxes.XY);
		add(bg);
		add(sp);
		add(t);
		add(i);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		for (touch in FlxG.touches.list)
		{
			if (touch.justReleased)
			{
				close();
			}
		}
	}

}

class Screen_orientation {

	private static var loadregularsubstate:SubState;
	private static var loadcustomsubstate:FlxSubState;
	private static var spriteGame:Sprite;
	private static var rollX:Float = 0;
	private static var evaluate:Bool = true;
	private static var openSubState:Bool = true;
	private static var axisGraduation:Float;
	private static var time:Float = 0;

	private static function EvaluateOrientation(e:Event):Void
	{
		time -= 0.01;
		if (time <= 0)
		{
			evaluate = false;
		}
		else if (openSubState)
		{
			rollX = FlxG.accelerometer.x;
			if (rollX >= axisGraduation || rollX <= -axisGraduation)
			{
				evaluate = false;
				openSubState = false;
				(loadregularsubstate != null) ? FlxG.state.openSubState(loadregularsubstate) : FlxG.state.openSubState(loadcustomsubstate);
			}
		}
	}

	public static function DetectOrientationDevice(title:String, info:String, graphic_path:String, back_color:Int = FlxColor.BLACK, timeEvaluate:Float = 0.5, graduation:Float = 0.3, customSubState:FlxSubState = null):Void
	{
		#if mobile
			axisGraduation = graduation;
			spriteGame = new Sprite();
			time = timeEvaluate;
			loadregularsubstate = null;
			loadcustomsubstate = null;
			(customSubState == null) ? loadregularsubstate = new SubState(title, info, graphic_path, back_color) : loadcustomsubstate = customSubState;
			(evaluate) ? spriteGame.addEventListener(Event.ENTER_FRAME, EvaluateOrientation, false): spriteGame.removeEventListener(Event.ENTER_FRAME, EvaluateOrientation, true);
		#end
	}

}