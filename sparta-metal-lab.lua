SPARTA_ROOT = "SPARTA-20131029"

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
		{
			["Adam Factory"] = [[../spartaFactoryModel/Factory/loadIntoSparta.lua]];
			["SPARTA Factory"] = "";
		};
		{
			["U-bracket with Switchable Bubble Nav"] = [[../sparta-scripts-and-models/FullDemos/wand-metal-demo.lua --jconf s:/jconf30/mixins/METaL.treetarget.aswand.jconf --jconf s:/jconf30/mixins/METaL.wiimotewandbuttons.jconf ]];
			["U-bracket with Virtuose in Bubble"] = [[../sparta-scripts-and-models/FullDemos/haption-metal-demo.lua]];
			["U-bracket with Virtuose on Mobile Robot"] = [[ --jconf s:/jconf30/mixins/METaL.handtarget.ashaptionbase.jconf --code "dofile [=[../sparta-scripts-and-models/FullDemos/VirtuoseOnRobotDemo.lua]=]" ]];
			
			["Virtuose on Mobile Robot - No Models"] = [[ --jconf s:/jconf30/mixins/METaL.handtarget.ashaptionbase.jconf --code "dofile [=[../sparta-scripts-and-models/Devices/METaL Haption on Robot.lua]=]" ]];
		};
		
		{
			stereo = "--jconf s:/jconf30/METaL.tracked.stereo.reordered.jconf";
			mono = "--jconf s:/jconf30/METaL.tracked.mono.reordered.jconf";
		};
	};
}

require "generator-shared" (launchers)