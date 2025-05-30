#ifdef APPLICATION_EXTERNS
#define HL_NAME(n) applicationStatus_##n

#include <hl.h>
#include <psapi.h>
#include <thread>
#include "internalUtils.h"

// Gets memory usage.
HL_PRIM signed long long HL_NAME(get_memory_usage)(_NO_ARG)
{
    PROCESS_MEMORY_COUNTERS info;
    GetProcessMemoryInfo(GetCurrentProcess(), &info, sizeof(info));
    return static_cast<signed long long>((size_t)info.WorkingSetSize);
}
DEFINE_PRIM(_I64, get_memory_usage, _NO_ARG);

// Gets CPU load.
HL_PRIM float HL_NAME(get_cpu_load)(_NO_ARG)
{
    return GetCPULoad();
}
DEFINE_PRIM(_F32, get_cpu_load, _NO_ARG);

// Gets Thread Count.
HL_PRIM int HL_NAME(get_thread_count)(_NO_ARG)
{
    return std::thread::hardware_concurrency();
}
DEFINE_PRIM(_I32, get_thread_count, _NO_ARG);
#endif