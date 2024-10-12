package hlwnative;

@:hlNative('hlwnative')
class HLDriveStatus
{
	/**
	 * Returns your total drive size in GB.
	 * @return Float
	 */
	public static function getTotalDriveSize():Float
		return HLNEXT.get_total_drive_size();

	/**
	 * Returns your free drive space in GB.
	 * @return Float
	 */
	public static function getFreeDriveSize():Float
		return HLNEXT.get_free_drive_size();
}
