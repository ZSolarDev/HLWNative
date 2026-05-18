#ifdef WINDOW_EXTERNS
#define HL_NAME(n) window_##n

#include <iostream>
#include <Windows.h>
#include <dwmapi.h>
#include <hl.h>
#include <shobjidl.h>
#include "internalUtils.h"
#pragma comment(lib, "dwmapi.lib")

// Sets the window to dark mode.
HL_PRIM void HL_NAME(set_window_dark_mode)(vstring* windowTitle, bool enable)
{
    std::string title = vstringConvert(windowTitle);
    int darkMode = enable ? 1 : 0;

    HWND window = FindWindowA(NULL, title.c_str());
    if (window == NULL)
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    if (window != NULL && S_OK != DwmSetWindowAttribute(window, 19, &darkMode, sizeof(darkMode)))
        DwmSetWindowAttribute(window, 20, &darkMode, sizeof(darkMode));
}
DEFINE_PRIM(_VOID, set_window_dark_mode, _STRING _BOOL);

// Make window layered
HL_PRIM void HL_NAME(set_window_layered)(vstring* windowTitle)
{
    std::string title = vstringConvert(windowTitle);

    HWND window = FindWindowA(NULL, title.c_str());
    if (window == NULL)
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    // Too lazy to check if it was already on lmaooo
    if (window != NULL) SetWindowLongA(window, -20, 0x00080000);
}
DEFINE_PRIM(_VOID, set_window_layered, _STRING);

// Sets the alpha of the window
HL_PRIM void HL_NAME(set_window_colorKey)(vstring* windowTitle, int colorKey)
{
    std::string title = vstringConvert(windowTitle);
    COLORREF COLOR = colorKey & 0x00FFFFFF;

    HWND window = FindWindowA(NULL, title.c_str());
    if (window == NULL)
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    if (window != NULL) SetLayeredWindowAttributes(window, COLOR, 0, 0x00000001);
}
DEFINE_PRIM(_VOID, set_window_colorKey, _STRING _I32);

// Sets the alpha of the window
HL_PRIM void HL_NAME(set_window_alpha)(vstring* windowTitle, int alpha)
{
    std::string title = vstringConvert(windowTitle);

    HWND window = FindWindowA(NULL, title.c_str());
    if (window == NULL)
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    if (window != NULL) SetLayeredWindowAttributes(window, 0xFF000000, alpha, 0x00000002);
}
DEFINE_PRIM(_VOID, set_window_alpha, _STRING _I32);

// Sets the titlebar color of the window.
HL_PRIM void HL_NAME(set_window_titlebar_color)(vstring* windowTitle, int targetColor)
{
    std::string title = vstringConvert(windowTitle);
    COLORREF COLOR = targetColor;

    HWND window = FindWindowA(NULL, title.c_str());
    // Look for child windows if top level aint found
    if (window == NULL) window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    DwmSetWindowAttribute(window, DWMWINDOWATTRIBUTE::DWMWA_CAPTION_COLOR, &COLOR, sizeof(COLOR));
}
DEFINE_PRIM(_VOID, set_window_titlebar_color, _STRING _I32);

// Makes the process DPI aware.
HL_PRIM void HL_NAME(set_window_dpi_aware)(_NO_ARG)
{
    SetProcessDPIAware();
}
DEFINE_PRIM(_VOID, set_window_dpi_aware, _NO_ARG);

// Opens a file picker dialog and returns the selected file path.
HL_PRIM vstring* HL_NAME(pick_file)(vstring* title, vstring* filterName, vstring* filterPattern)
{
    HRESULT hr = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED);
    IFileOpenDialog* dialog = NULL;
    hr = CoCreateInstance(CLSID_FileOpenDialog, NULL, CLSCTX_ALL, IID_IFileOpenDialog, (void**)&dialog);
    if (FAILED(hr)) { CoUninitialize(); return NULL; }
    dialog->SetTitle(constToWideChar(vstringConvert(title)));
    COMDLG_FILTERSPEC spec = { constToWideChar(vstringConvert(filterName)), constToWideChar(vstringConvert(filterPattern)) };
    dialog->SetFileTypes(1, &spec);
    hr = dialog->Show(NULL);
    if (FAILED(hr)) { dialog->Release(); CoUninitialize(); return NULL; }
    IShellItem* item = NULL;
    dialog->GetResult(&item);
    PWSTR path = NULL;
    item->GetDisplayName(SIGDN_FILESYSPATH, &path);
    item->Release();
    dialog->Release();
    CoUninitialize();
    return wideToVstring(path);
}
DEFINE_PRIM(_STRING, pick_file, _STRING _STRING _STRING);

// Opens a directory picker dialog and returns the selected directory path.
HL_PRIM vstring* HL_NAME(pick_directory)(vstring* title)
{
    HRESULT hr = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED);
    IFileOpenDialog* dialog = NULL;
    hr = CoCreateInstance(CLSID_FileOpenDialog, NULL, CLSCTX_ALL, IID_IFileOpenDialog, (void**)&dialog);
    dialog->SetTitle(constToWideChar(vstringConvert(title)));
    FILEOPENDIALOGOPTIONS opts;
    dialog->GetOptions(&opts);
    dialog->SetOptions(opts | FOS_PICKFOLDERS);
    hr = dialog->Show(NULL);
    IShellItem* item = NULL;
    dialog->GetResult(&item);
    PWSTR path = NULL;
    item->GetDisplayName(SIGDN_FILESYSPATH, &path);
    item->Release();
    dialog->Release();
    CoUninitialize();
    vstring* result = wideToVstring(path);
    return result;
}
DEFINE_PRIM(_STRING, pick_directory, _STRING);
#endif