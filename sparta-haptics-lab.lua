SPARTA_ROOT = "SPARTA_build_Oct_25_2012"

-- This is up here instead of inline in fillTemplate
-- so the batch files don't start with a bunch of tabs on
-- each line.
template = [[
pushd "%~dp0"
cd "{SPARTA_ROOT}"
bin\sparta.exe {argString}
pause
]]

launchers = {
	filename = "SPARTA %s.cmd";
	fillTemplate = function(argString)
		local result = template:gsub("{SPARTA_ROOT}", SPARTA_ROOT):gsub("{argString}", argString)
		return result
	end;
	options = {
		--places
		--{
			--["SPARTA Factory"] = "";
		--};
		--device configurations
		{
			["DualOmni"] = [[../sparta-scripts-and-models/Devices/Dual_Omni.lua]];
			["LeftOmni_RightGlove"] = [[../sparta-scripts-and-models/Devices/LeftOmni_RightGlove.lua]];
			["LeftGlove_RightOmni"] = [[../sparta-scripts-and-models/Devices/LeftGlove_RightOmni.lua]];
			["RightOmni_Only"] = [[../sparta-scripts-and-models/Devices/RightOmni.lua]];
			["LeftOmni_Only"] = [[../sparta-scripts-and-models/Devices/LeftOmni.lua]];
		};
		--models
		{
			["Burr Puzzle"] = [[../sparta-scripts-and-models/BlockPuzzle-Burr/Lua/run_burr_puzzle.lua]];
			["Fly Wheel"] = [[../sparta-scripts-and-models/FlyWheel/demo.lua]];
			["UBracket"] = [[../sparta-scripts-and-models/UBracket/bracket.lua]];
			["PegAndKey"] = [[../sparta-scripts-and-models/Bimanual_Study/main.lua]];
		};
		--display configurations
		{
			stereo = "--jconf ../haptics-lab-jconf/fishbowl/hapticslab.fishbowl.tracked.stereo.jconf";
			mono = "--jconf ../haptics-lab-jconf/fishbowl/hapticslab.fishbowl.tracked.mono.jconf";
		};
	};
}

require "generator-shared" (launchers)