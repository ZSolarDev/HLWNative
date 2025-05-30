package hlwnative;

class HLExternal
{
	/**
	 * This function doesn't work,
	 * It will indeed work in future versions though.
     * (^ future me isn't too sure about that ^)
     * (^ future me is not adding fixing this anytime soon ^)
     * @since 1.0.0
	 */
	public static function toastNotification(toastTitle:String, toastContent:String):Bool
	{
		return false;
		// Does literally nothing 💀
		// return HLNEXTInterface.make_toast_notification(toastTitle, toastContent);
	}
}
