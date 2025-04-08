--[[
	Plot Hub - Main Loader
	Autor: Olavo635
	GitHub: https://github.com/Olavo635
--]]

local baseURL = "https://raw.githubusercontent.com/Olavo635/Roblox-scripts/main/"

local function import(path)
	local success, result = pcall(function()
		return loadstring(game:HttpGet(baseURL .. path, true))()
	end)
	if not success then
		warn("Erro ao carregar:", path, "\n", result)
	end
	return result
end

-- Configuração global
local config = import("assets/config.lua")

-- Criar GUI principal
local window = import("ui/plot_gui.lua")(config)

-- Criar seções e carregar botões
import("ui/sections.lua")(window, config)

print("[Plot Hub] carregado com sucesso!")
