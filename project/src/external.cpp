#define HL_NAME(n) external_##n

#include <hl.h>
#include <strsafe.h>
#include "internalUtils.h"

// Creates a toast notification.
HL_PRIM bool HL_NAME(makeToastNotification)(vstring* toastTitle, vstring* content)
{
    NOTIFYICONDATA m_NID;

    memset(&m_NID, 0, sizeof(m_NID));
    m_NID.cbSize = sizeof(m_NID);
    m_NID.hWnd = GetForegroundWindow();
    m_NID.uFlags = NIF_MESSAGE | NIIF_WARNING | NIS_HIDDEN;

    m_NID.uVersion = NOTIFYICON_VERSION_4;

    if (!Shell_NotifyIcon(NIM_ADD, &m_NID))
        return FALSE;

    Shell_NotifyIcon(NIM_SETVERSION, &m_NID);

    m_NID.uFlags |= NIF_INFO;
    m_NID.uTimeout = 1000;
    m_NID.dwInfoFlags = NULL;

    LPCTSTR lTitle = constToWideChar(vstringConvert(toastTitle));
    LPCTSTR lDesc = constToWideChar(vstringConvert(content));

    if (StringCchCopy(m_NID.szInfoTitle, sizeof(m_NID.szInfoTitle), lTitle) != S_OK)
        return FALSE;

    if (StringCchCopy(m_NID.szInfo, sizeof(m_NID.szInfo), lDesc) != S_OK)
        return FALSE;

    return Shell_NotifyIcon(NIM_MODIFY, &m_NID);
}
DEFINE_PRIM(_BOOL, makeToastNotification, _STRING _STRING);