# V1.0.0 Changelog:

- Added 4 Classes (1 Defective), 6 New Functions Total:
  - HLApplicationStatus.hx:
    - getMemoryUsage():Int [ Returns the memory the program is using. ]
    - getCPULoad():Float [ Gets the current CPU load by the program. (Results are quite questionable.) ]
  - HLDriveStatus.hx:
    - getTotalDriveSize():Float [ Returns total drive size in GB. ]
    - getFreeDriveSize():Float [ Returns free drive size in GB. ]
  - HLNativeWindow.hx:
    - setWindowDarkMode(enabled:Bool) [ Sets the windows dark mode property. ]
    - setWindowTitlevarColor(targetColor:Int) [ (WINDOWS 11 ONLY) Sets the color of your windows title bar. ]

## Developer Notes:
This is the first release, yippie! Also if you're here to download the library on the webpage you're on right now, I wonder why you don't download the library via haxelib...
