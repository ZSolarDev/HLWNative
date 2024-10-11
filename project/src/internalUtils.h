#pragma once

#ifndef INTERNAL_UTILS_INCLUDE
#define INTERNAL_UTILS_INCLUDE

const char* vstringConvert(vstring* s);
float CalculateCPULoad(unsigned long long idleTicks, unsigned long long totalTicks);
unsigned long long FileTimeToInt64(const FILETIME& ft);
float GetCPULoad();
double getDriveStatus(bool retMode);
wchar_t* constToWideChar(const char* str);

#endif