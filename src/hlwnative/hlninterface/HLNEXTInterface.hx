package hlwnative.hlninterface;

@:allow(hlwnative.HLExternal)
@:allow(hlwnative.HLDriveStatus)
@:allow(hlwnative.HLNativeWindow)
@:allow(hlwnative.HLApplicationStatus)
class HLNEXTInterface
{
	@:noCompletion @:hlNative("native/hlnwin") private static function set_window_dark_mode(windowName:String, enable:Bool):Void {}

    @:noCompletion @:hlNative("native/hlnwin") private static function set_window_layered(windowName:String):Void {}

    @:noCompletion @:hlNative("native/hlnwin") private static function set_window_alpha(windowName:String, alpha:Int):Void {}

    @:noCompletion @:hlNative("native/hlnwin") private static function set_window_colorKey(windowName:String, colorKey:Int):Void {}

	@:noCompletion @:hlNative("native/hlnwin") private static function set_window_titlebar_color(windowName:String, targetColor:Int):Void {}

	@:noCompletion @:hlNative("native/hlnext") private static function make_toast_notification(toastTitle:String, content:String):Bool
		return false;

	@:noCompletion @:hlNative("native/hlndrv") private static function get_free_drive_size():Float
		return 0.0;

	@:noCompletion @:hlNative("native/hlndrv") private static function get_total_drive_size():Float
		return 0.0;

	@:noCompletion @:hlNative("native/hlnapp") private static function get_memory_usage():hl.I64
		return 0;

	@:noCompletion @:hlNative("native/hlnapp") private static function get_cpu_load():Single
		return 0.0;
}
