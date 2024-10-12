package hlwnative;

@:hlNative("hlwnative")
class HLExternal
{
	/**
	 * This function doesn't work,
	 * It will indeed work in future versions though.
	 */
	public static function toastNotification(toastTitle:String, toastContent:String):Bool
	{
		return false;
		// Does literally nothing 💀
		// return HLNEXT.make_toast_notification(toastTitle, toastContent);
	}
}
