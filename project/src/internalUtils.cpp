#include <hl.h>
#include <Windows.h>
#include "internalUtils.h"

const char* vstringConvert(vstring* s)
{
    return (const char*)hl_to_utf8((const uchar*)s->bytes);
}

wchar_t* constToWideChar(const char* str)
{
    size_t constCharLen = strlen(str);
    wchar_t* wideChar = new wchar_t[constCharLen + 1];
    MultiByteToWideChar(CP_ACP, 0, str, -1, wideChar, 100);
    return wideChar;
}

double getDriveStatus(bool retMode)
{
    ULARGE_INTEGER freeBytesAvailableToCaller;
    ULARGE_INTEGER totalNumberOfBytes;
    ULARGE_INTEGER totalNumberOfFreeBytes;

    if (GetDiskFreeSpaceExA(NULL, &freeBytesAvailableToCaller, &totalNumberOfBytes, &totalNumberOfFreeBytes)) {
        double freeSpaceGB = static_cast<double>(freeBytesAvailableToCaller.QuadPart) / 1073741824;
        double totalSpaceGB = static_cast<double>(totalNumberOfBytes.QuadPart) / 1073741824;

        if (retMode) return freeSpaceGB; else return totalSpaceGB;
    }
    else
        printf("Failed to get disk space! %d\\n", GetLastError());

    return 0;
}

float CalculateCPULoad(unsigned long long idleTicks, unsigned long long totalTicks)
{
    static unsigned long long _previousTotalTicks = 0;
    static unsigned long long _previousIdleTicks = 0;

    unsigned long long totalTicksSinceLastTime = totalTicks - _previousTotalTicks;
    unsigned long long idleTicksSinceLastTime = idleTicks - _previousIdleTicks;

    float ret = 1.0f - ((totalTicksSinceLastTime > 0) ? ((float)idleTicksSinceLastTime) / totalTicksSinceLastTime : 0);

    _previousTotalTicks = totalTicks;
    _previousIdleTicks = idleTicks;
    return ret;
}

unsigned long long FileTimeToInt64(const FILETIME& ft) { return (((unsigned long long)(ft.dwHighDateTime)) << 32) | ((unsigned long long)ft.dwLowDateTime); }

float GetCPULoad()
{
    FILETIME idleTime, kernelTime, userTime;
    return GetSystemTimes(&idleTime, &kernelTime, &userTime) ? CalculateCPULoad(FileTimeToInt64(idleTime), FileTimeToInt64(kernelTime) + FileTimeToInt64(userTime)) * 100.0f : -1.0f;
}