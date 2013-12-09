VRJUGGLUA_ROOT = [[V:\Applications\vrjugglua\windows-snapshot\bin\NavTestbed.exe]]

local function stripPathAndExtension(str)
	slash_location = string.find(str, '\\')
	if slash_location == nil then
		str = string.gsub(str, " ", "")
		str = string.gsub(str, "-", "_")
		str = string.gsub(str, "__", "_")
		str = string.gsub(str, ".osg", "")
		str = string.gsub(str, ".ive", "")
		str = string.gsub(str, ".STL", "")
		str = string.gsub(str, ".stl", "")
		return str
	else
		return stripPathAndExtension(string.sub(str, slash_location + 1))
	end
end

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
			[stripPathAndExtension(arg[1])] = arg[1];
		};
	};
}

require "generator-shared" (launchers)