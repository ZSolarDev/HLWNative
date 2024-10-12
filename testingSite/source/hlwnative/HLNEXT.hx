package hlwnative;

@:hlNative("hlwnative")
class HLNEXT
{
	@:allow(hlwnative.HLNativeWindow)
	@:noPrivateAccess private static function set_window_dark_mode(windowName:String, enable:Bool):Void {}

	@:allow(hlwnative.HLNativeWindow)
	@:noPrivateAccess private static function set_window_titlebar_color(windowName:String, targetColor:Int):Void {}

	@:allow(hlwnative.HLExternal)
	@:noPrivateAccess private static function make_toast_notification(toastTitle:String, content:String):Bool
		return false;

	@:allow(hlwnative.HLDriveStatus)
	@:noPrivateAccess private static function get_free_drive_size():Float
		return 0.0;

	@:allow(hlwnative.HLDriveStatus)
	@:noPrivateAccess private static function get_total_drive_size():Float
		return 0.0;

	@:allow(hlwnative.HLApplicationStatus)
	@:noPrivateAccess private static function get_memory_usage():hl.I64
		return 0;

	@:allow(hlwnative.HLApplicationStatus)
	@:noPrivateAccess private static function get_cpu_load():Single
		return 0.0;
}
