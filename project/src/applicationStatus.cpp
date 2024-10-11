#define HL_NAME(n) applicationStatus_##n

#include <hl.h>
#include <psapi.h>
#include "internalUtils.h"

// Gets memory usage.
HL_PRIM signed long long HL_NAME(getMemoryUsage)(_NO_ARG)
{
    PROCESS_MEMORY_COUNTERS info;
    GetProcessMemoryInfo(GetCurrentProcess(), &info, sizeof(info));
    return static_cast<signed long long>((size_t)info.WorkingSetSize);
}
DEFINE_PRIM(_I64, getMemoryUsage, _NO_ARG);

// Gets CPU load.
HL_PRIM float HL_NAME(getCPULoad)(_NO_ARG)
{
    return GetCPULoad();
}
DEFINE_PRIM(_F32, getCPULoad, _NO_ARG);