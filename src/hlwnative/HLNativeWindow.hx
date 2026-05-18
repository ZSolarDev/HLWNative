package hlwnative;

import hlwnative.hlninterface.HLNEXTInterface;
import lime.app.Application;
import sys.FileSystem;

using StringTools;

class HLNativeWindow
{
	/**
	 * Sets the windows dark mode property.
	 * @param enable 
     * @since 1.0.0
	 */
	public static function setWindowDarkMode(enable:Bool):Void
	{
		HLNEXTInterface.set_window_dark_mode(Application.current.window.title, enable);
	}

	/**
	 * (WINDOWS 11 ONLY) Sets the color of your windows title bar.
	 * 
	 * @param targetColor The color of the window title bar.
     * @since 1.0.0
	 */
	public static function setWindowTitlebarColor(targetColor:Int):Void
	{
		HLNEXTInterface.set_window_titlebar_color(Application.current.window.title,
        HLNUtils.rgbToBgr(HLNUtils.deconstructHex(targetColor)));
	}

    /**
     * Sets the windows to layered mode(Color Keying will work if this function is called.)
     * @since 1.1.0
     */
    public static function setWindowLayered():Void
	{
		HLNEXTInterface.set_window_layered(Application.current.window.title);
	}

    /**
     * Sets the windows alpha property.
     * @param alpha An alpha value between 0 and 255
     * @since 1.1.0
     */
    public static function setWindowAlpha(alpha:Int):Void
	{
		HLNEXTInterface.set_window_alpha(Application.current.window.title, alpha);
	}

    /**
     * Sets the color key color of the window.
     * @param colorKey The color to key out.
     * @since 1.1.0
     */
    public static function setWindowColorKey(colorKey:Int):Void
	{
		HLNEXTInterface.set_window_colorKey(Application.current.window.title, HLNUtils.rgbToBgr(HLNUtils.deconstructHex(colorKey)));
	}

    /**
     * Opens a file dialog and returns the path of the selected file.
     * @param title The title of the dialog. e.g. `"Open File"`
     * @param filterName The name of the filter. e.g. `"Image or Audio Files"`
     * @param filterPattern The pattern of the filter. e.g. `"*.png;*.jpg;*.mp3;*.wav"`
     * @return String
     * @since 1.3.0
     */
    public static function pickFile(title:String, filterName:String, filterPattern:String):String
        return HLNEXTInterface.pick_file(title, filterName, filterPattern);

    /**
     * Opens a directory dialog and returns the path of the selected directory.
     * @param title The title of the dialog. e.g. `"Open Directory"`
     * @return String
     * @since 1.3.0
     */
    public static function pickDirectory(title:String):String {
        var path = HLNEXTInterface.pick_directory(title);
        FileSystem.deleteFile('./hlndebug.txt');
        return path;
    }
}
