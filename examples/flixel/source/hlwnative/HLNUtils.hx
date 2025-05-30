package hlwnative;

enum Instruction
{
	NONE; // No current instruction
	BOC; // Beginning of collection
	SKIPNEXT; // Skip the next color
	NEXTRED; // Next color is/will be red
	NEXTGREEN; // Next color is/will be green
	NEXTBLUE; // Next color is/will be blue
	EOC; // End of collection
}

class HLNUtils {
    public static function deconstructHex(targetColor:Int):Map<String, String>
    {
        var colorStr:String = '0x${StringTools.hex(targetColor)}';
		var colors:Map<String, String> = ['Red' => '', 'Green' => '', 'Blue' => ''];
		var instruction:Instruction = NONE;
		var startedConversion:Bool = false;
		var bgrStr = '';
		var res:Int = 0x00FFFFFF;
		var hasAlpha = colorStr.length == 10;
		for (charID in 0...colorStr.length)
		{
			var char = colorStr.charAt(charID);
			var nextChar = colorStr.charAt(charID + 1);
			var prevChar = colorStr.charAt(charID - 1);
			// running!
			if (char != '')
			{
				// Is this 0x? if so, move on
				if (char == '0' && nextChar == 'x' || char == 'x' && prevChar == '0')
				{
					// this is 0x');
					if (!startedConversion)
						continue;
				}
				// Does the color include an alpha value? If so, run that specific logic.
				if (hasAlpha)
				{
					// Is this the character right after 0x? If so, move on and skip the next character.
					if (prevChar == 'x' && colorStr.charAt(charID - 2) == '0' && !startedConversion)
					{
						instruction = SKIPNEXT;
						continue;
					}
					// Was the instruction set to skip the next character? If so, skip this character and begin the rgb collection.
					if (instruction == SKIPNEXT)
					{
						instruction = BOC;
						continue;
					}
				}
				else
				{
					// Does the color include an alpha value? If not, start the collection immediately.
					if (prevChar == 'x' && colorStr.charAt(charID - 2) == '0' && !startedConversion)
					{
						startedConversion = true;
						instruction = NEXTRED;
						continue;
					}
				}
				// Was the instruction set to begin the rgb collection? If so, prepare the next iteration for rgb collection.
				if (instruction == BOC)
				{
					startedConversion = true;
					instruction = NEXTRED;
					continue;
				}
				// Has the rgb collection started? If so, start writing colors to the colors map.
				if (startedConversion)
				{
					if (instruction == NEXTRED)
					{
						// writing red to the map
						instruction = NEXTGREEN;
						colors.set('Red', '$prevChar$char');
						continue;
					}
					if (instruction == NEXTGREEN)
					{
						// writing green to the map
						if (colors.get('Green') == '')
							colors.set('Green', char);
						else
						{
							colors.set('Green', '$prevChar$char');
							instruction = NEXTBLUE;
						}
						continue;
					}
					if (instruction == NEXTBLUE)
					{
						// writing blue to the map
						if (colors.get('Blue') == '')
							colors.set('Blue', char);
						else
						{
							colors.set('Blue', '$prevChar$char');
							// end of conversion
							instruction = EOC;
						}

						// Is the rgb collection complete? If so, start constructing the final string and convert it to an int.
						if (instruction == EOC)
						{
							// Return final map
                            return colors;
							bgrStr = '0x${colors.get("Blue")}${colors.get("Green")}${colors.get("Red")}';
							res = Std.parseInt(bgrStr);
							break;
						}
					}
				}
			}
		}
        return null;
    }

    public static function rgbToBgr(colors:Map<String, String>):Int
    {
        var bgrStr = '0x${colors.get("Blue")}${colors.get("Green")}${colors.get("Red")}';
		return Std.parseInt(bgrStr);
    }
}