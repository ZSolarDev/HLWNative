package hlwnative;

import hlwnative.hlninterface.HLNEXTInterface;

class HLDriveStatus
{
	/**
	 * Returns your total drive size in GB.
	 * @return Float
     * @since 1.0.0
	 */
	public static function getTotalDriveSize():Float
		return HLNEXTInterface.get_total_drive_size();

	/**
	 * Returns your free drive space in GB.
	 * @return Float
     * @since 1.0.0
	 */
	public static function getFreeDriveSize():Float
		return HLNEXTInterface.get_free_drive_size();
}
