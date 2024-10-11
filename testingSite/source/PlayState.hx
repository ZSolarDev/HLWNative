package;

import flixel.FlxState;
import lime.app.Application;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		hlwnative.HLNativeWindow.setWindowDarkMode(Application.current.window.title, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
