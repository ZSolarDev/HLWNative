package hlwnative;

import hlwnative.hlninterface.HLNEXTInterface;

class HLApplicationStatus
{
	/**
	 * Gets the current memory the program is using.
	 * @return Int
	 */
	public static function getMemoryUsage():Int
		return HLNEXTInterface.get_memory_usage().toInt();

	/**
	 * Gets the current CPU load by the program.
	 * @return Float
	 */
	public static function getCPULoad():Float
		return HLNEXTInterface.get_cpu_load();

    /**
	 * Gets the number of threads available.
	 * @return Float
	 */
	public static function getTotalThreads():Float
		return HLNEXTInterface.get_thread_count();
}
