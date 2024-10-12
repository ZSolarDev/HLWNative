package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import hlwnative.*;
import lime.app.Application;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		HLNativeWindow.setWindowTitlebarColor(0x2B98FF);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.S)
			trace('Disk space: ${HLDriveStatus.getFreeDriveSize()} / ${HLDriveStatus.getTotalDriveSize()}');
		if (FlxG.keys.justPressed.A)
			trace('Memory Usage: ${HLApplicationStatus.getMemoryUsage()} || CPU Load: ${HLApplicationStatus.getCPULoad()}');
	}
}
