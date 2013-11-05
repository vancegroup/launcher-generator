VRJUGGLUA_ROOT = [[V:\Applications\vrjugglua\windows-snapshot\bin\NavTestbed.exe]]

-- This is up here instead of inline in fillTemplate
-- so the batch files don't start with a bunch of tabs on
-- each line.
template = [[
pushd "%~dp0"
{VRJUGGLUA_ROOT} {argString}
pause
]]

launchers = {
	filename = "VRJuggLua %s.cmd";
	fillTemplate = function(argString)
		local result = template:gsub("{VRJUGGLUA_ROOT}", VRJUGGLUA_ROOT):gsub("{argString}", argString)
		return result
	end;
	options = {
		{
			["Adam Factory Navigation Only"] = [[S:/DEMOS/spartaFactoryModel/Factory/standalone_main.lua]];
			["Adam Factory Forklift Driving"] = [[S:\DEMOS\adam-factory\Factory\standalone_main.lua]];
			["Virtually Magic"] = [[S:/DEMOS/virtually-magic/Scripts/magicmain.lua]];
			["Virtual METaL"] = [[S:/DEMOS/Virtual-METaL/main.lua]];
		};
		
		{
			stereo = [[--jconf S:/jconf30/METaL.tracked.stereo.reordered.withwand.jconf]];
			mono = [[--jconf S:/jconf30/METaL.tracked.mono.reordered.withwand.jconf]];
		};
	};
}

require "generator-shared" (launchers)