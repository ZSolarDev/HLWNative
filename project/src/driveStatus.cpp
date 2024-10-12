#define HL_NAME(n) driveStatus_##n

#include <hl.h>
#include "internalUtils.h"

// Gets free drive size.
HL_PRIM double HL_NAME(get_free_drive_size)(_NO_ARG)
{
    return getDriveStatus(true);
}
DEFINE_PRIM(_F64, get_free_drive_size, _NO_ARG);

// Gets total drive size.
HL_PRIM double HL_NAME(get_total_drive_size)(_NO_ARG)
{
    return getDriveStatus(false);
}
DEFINE_PRIM(_F64, get_total_drive_size, _NO_ARG);