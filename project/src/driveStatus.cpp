#define HL_NAME(n) driveStatus_##n

#include <hl.h>
#include "internalUtils.h"

// Gets free drive size.
HL_PRIM double HL_NAME(getFreeDriveSize)(_NO_ARG)
{
    return getDriveStatus(true);
}
DEFINE_PRIM(_F64, getFreeDriveSize, _NO_ARG);

// Gets total drive size.
HL_PRIM double HL_NAME(getTotalDriveSize)(_NO_ARG)
{
    return getDriveStatus(false);
}
DEFINE_PRIM(_F64, getTotalDriveSize, _NO_ARG);