local mtindex = {}

function mtindex:writeLauncher(optionsString, argsString)
	local file = assert(io.open(self.filename:format(optionsString), "w"))
	file:write(self.fillTemplate(argsString))
	file:close()
end

function mtindex:recurse_options(idx, optionsString, argsString)
	if idx > #self.options then
		-- If we've made a choice from each options sub-table
		self:writeLauncher(optionsString, argsString)
		print(optionsString)
	else
		for opt, arg in pairs(self.options[idx]) do
			self:recurse_options(idx+1, optionsString .. " " .. opt, argsString .. " " .. arg)
		end
	end
end

local function generator(launchdata)
	local context = setmetatable(launchdata, {__index = mtindex})
	context:recurse_options(1, "", "")
end

return generator
