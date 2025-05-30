package hlwnative;

import hlwnative.hlninterface.HLNEXTInterface;
import lime.app.Application;

using StringTools;

class HLNativeWindow
{
	/**
	 * Sets the windows dark mode property.
	 * @param enable
	 */
	public static function setWindowDarkMode(enable:Bool):Void
	{
		HLNEXTInterface.set_window_dark_mode(Application.current.window.title, enable);
	}

	/**
	 * Sets the color of your windows title bar.
	 * 
	 * @param targetColor The color of the window title bar.
	 */
	public static function setWindowTitlebarColor(targetColor:Int):Void
	{
		HLNEXTInterface.set_window_titlebar_color(Application.current.window.title,
        HLNUtils.rgbToBgr(HLNUtils.deconstructHex(targetColor)));
	}

    public static function setWindowLayered():Void
	{
		HLNEXTInterface.set_window_layered(Application.current.window.title);
	}

    public static function setWindowAlpha(alpha:Int):Void
	{
		HLNEXTInterface.set_window_alpha(Application.current.window.title, alpha);
	}

    public static function setWindowColorKey(colorKey:Int):Void
	{
		HLNEXTInterface.set_window_colorKey(Application.current.window.title, colorKey);
	}
}
