package hlwnative;

@:hlNative('hlwnative')
class HLApplicationStatus
{
	/**
	 * Gets the current memory the program is using.
	 * @return Int
	 */
	public static function getMemoryUsage():Int
		return HLNEXT.get_memory_usage().toInt();

	/**
	 * Gets the current CPU load by the program.
	 * @return Float
	 */
	public static function getCPULoad():Float
		return HLNEXT.get_cpu_load();
}
