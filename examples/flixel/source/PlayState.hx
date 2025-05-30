package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import hlwnative.*;

class PlayState extends FlxState
{
	var colorArray = [
		0xFF0000, 0xFF5100, 0xFF7F16, 0xFFC116, 0xFFFB00, 0xADFF16, 0x2BFF47, 0x2BFF95, 0x2BF8FF, 0x2B87FF, 0x2B39FF, 0x872BFF, 0xA02BFF, 0xD52BFF, 0xE62BFF,
		0xFF00DD, 0xFF44E6, 0xFF7DE3, 0xFFB5EF, 0xFFD6F6, 0xFFFFFF, 0xFFC6C6, 0xFFABAB, 0xFF8989, 0xFF6B6B, 0xFF4343, 0xFF3333,
	];
	var colorBarColorTxt:FlxText;
	var colorIndex = -1.0;
	var animatingColor = false;

	override public function create()
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.GRAY;
		colorBarColorTxt = new FlxText();
		colorBarColorTxt.text = '
            Press Space to change the window bar color!\n
            Memory Usage: \n
            CPU Load: \n
            Drive Space: \n
            Threads Total:
        ';
		colorBarColorTxt.size = 25;
		colorBarColorTxt.alignment = CENTER;
		colorBarColorTxt.screenCenter();
		add(colorBarColorTxt);
        HLNativeWindow.setWindowLayered();
        HLNativeWindow.setWindowAlpha(128);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		colorBarColorTxt.text = '
            Press Space to change the window bar color!\n
            Press E to animate the window bar color!\n
            Memory Usage: ${HLApplicationStatus.getMemoryUsage()} \n
            CPU Load: ${HLApplicationStatus.getCPULoad()} \n
            Drive Space: ${HLDriveStatus.getTotalDriveSize()} /  ${HLDriveStatus.getFreeDriveSize()}\n
            Threads Total: ${HLApplicationStatus.getTotalThreads()} \n
        ';
		colorBarColorTxt.screenCenter();
		if (FlxG.keys.justPressed.SPACE && !animatingColor)
		{
			if (colorIndex == -1)
				colorIndex = 0;
			else
				colorIndex = (colorIndex + 1) % colorArray.length;

			HLNativeWindow.setWindowTitlebarColor(colorArray[Std.int(colorIndex)]);
		}
		else
		{
			if (FlxG.keys.justPressed.E)
			{
				animatingColor = !animatingColor;
				if (!animatingColor)
					colorIndex = 0;
			}
		}
		if (animatingColor)
		{
			colorIndex = (colorIndex + 0.2) % colorArray.length;
			HLNativeWindow.setWindowTitlebarColor(colorArray[Std.int(colorIndex)]);
		}
	}
}
