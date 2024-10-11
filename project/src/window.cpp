#define HL_NAME(n) window_##n

#include <iostream>
#include <Windows.h>
#include <dwmapi.h>
#include <hl.h>
#include "internalUtils.h"
#pragma comment(lib, "dwmapi.lib")

// Sets the window to dark mode.
HL_PRIM void HL_NAME(setWindowDarkMode)(vstring* windowTitle, bool enable)
{
    std::string title = vstringConvert(windowTitle);
    int darkMode = enable ? 1 : 0;

    HWND window = FindWindowA(NULL, title.c_str());
    if (window == NULL)
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    if (window != NULL && S_OK != DwmSetWindowAttribute(window, 19, &darkMode, sizeof(darkMode)))
        DwmSetWindowAttribute(window, 20, &darkMode, sizeof(darkMode));
}
DEFINE_PRIM(_VOID, setWindowDarkMode, _STRING _BOOL);

// Sets the titlebar color of the window.
HL_PRIM void HL_NAME(setWindowTitlebarColor)(vstring* windowTitle, int targetColor)
{
    std::string title = vstringConvert(windowTitle);
    COLORREF COLOR = targetColor;

    HWND window = FindWindowA(NULL, title.c_str());
    // Look for child windows if top level aint found
    if (window == NULL) window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    DwmSetWindowAttribute(window, DWMWINDOWATTRIBUTE::DWMWA_CAPTION_COLOR, &COLOR, sizeof(COLOR));
}
DEFINE_PRIM(_VOID, setWindowTitlebarColor, _STRING _I32);

// Makes the process DPI aware.
HL_PRIM void HL_NAME(setWindowDPIAware)(_NO_ARG)
{
    SetProcessDPIAware();
}
DEFINE_PRIM(_VOID, setWindowDPIAware, _NO_ARG);