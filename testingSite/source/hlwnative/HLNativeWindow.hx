package hlwnative;

@:hlNative("hlwnative")
class HLNativeWindow
{
	public static function setWindowDarkMode(windowName:String, enable:Bool):Void {}

	public static function setWindowTitlebarColor(windowName:String, targetColor:Int):Void {}
}
