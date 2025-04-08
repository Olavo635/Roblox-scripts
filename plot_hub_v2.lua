-- Plot Hub v2 por Olavo635 e ChatGPT
-- Ícones + seções minimizáveis + compatível com executores (Delta, Fluxus, JJSploit)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local config = {
	TopBarHeight = 30,
	Padding = 8,
	CornerRadius = UDim.new(0, 8),
	Font = Enum.Font.Gotham,
	Colors = {
		Background = Color3.fromRGB(30, 30, 30),
		TopBar = Color3.fromRGB(40, 40, 40),
		Button = Color3.fromRGB(60, 60, 60),
		Text = Color3.fromRGB(255, 255, 255),
	}
}

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "PlotHub"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = config.Colors.Background
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = config.CornerRadius

local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1, 0, 0, config.TopBarHeight)
topBar.BackgroundColor3 = config.Colors.TopBar
topBar.BorderSizePixel = 0
Instance.new("UICorner", topBar).CornerRadius = config.CornerRadius

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Plot Hub"
title.Font = config.Font
title.TextSize = 18
title.TextColor3 = config.Colors.Text
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local minimize = Instance.new("TextButton", topBar)
minimize.Size = UDim2.new(0, 25, 1, 0)
minimize.Position = UDim2.new(1, -55, 0, 0)
minimize.Text = "-"
minimize.Font = config.Font
minimize.TextSize = 20
minimize.TextColor3 = config.Colors.Text
minimize.BackgroundTransparency = 1

local close = Instance.new("TextButton", topBar)
close.Size = UDim2.new(0, 25, 1, 0)
close.Position = UDim2.new(1, -30, 0, 0)
close.Text = "X"
close.Font = config.Font
close.TextSize = 20
close.TextColor3 = config.Colors.Text
close.BackgroundTransparency = 1

local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(1, -config.Padding * 2, 1, -config.TopBarHeight - config.Padding * 2)
scroll.Position = UDim2.new(0, config.Padding, 0, config.TopBarHeight + config.Padding)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, config.Padding)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Função de botão com ícone
local function criarBotao(nome, scriptURL, iconId, parent)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Text = ""
	btn.BackgroundColor3 = config.Colors.Button
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = config.CornerRadius
	btn.Parent = parent

	local icon = Instance.new("ImageLabel", btn)
	icon.Size = UDim2.new(0, 24, 0, 24)
	icon.Position = UDim2.new(0, 8, 0.5, -12)
	icon.BackgroundTransparency = 1
	icon.Image = "rbxassetid://" .. tostring(iconId)

	local label = Instance.new("TextLabel", btn)
	label.Size = UDim2.new(1, -40, 1, 0)
	label.Position = UDim2.new(0, 40, 0, 0)
	label.Text = nome
	label.Font = config.Font
	label.TextSize = 16
	label.TextColor3 = config.Colors.Text
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left

	btn.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(scriptURL, true))()
		end)
	end)
end

-- Criar uma seção
local function criarSecao(titulo)
	local container = Instance.new("Frame", scroll)
	container.Size = UDim2.new(1, 0, 0, 0)
	container.BackgroundTransparency = 1
	container.AutomaticSize = Enum.AutomaticSize.Y

	local header = Instance.new("TextButton", container)
	header.Size = UDim2.new(1, 0, 0, 30)
	header.Text = "▼ " .. titulo
	header.Font = config.Font
	header.TextSize = 18
	header.TextColor3 = config.Colors.Text
	header.BackgroundColor3 = config.Colors.TopBar
	header.TextXAlignment = Enum.TextXAlignment.Left
	Instance.new("UICorner", header).CornerRadius = config.CornerRadius

	local content = Instance.new("Frame", container)
	content.Size = UDim2.new(1, 0, 0, 0)
	content.BackgroundTransparency = 1
	content.AutomaticSize = Enum.AutomaticSize.Y

	local list = Instance.new("UIListLayout", content)
	list.Padding = UDim.new(0, config.Padding)
	list.SortOrder = Enum.SortOrder.LayoutOrder

	local aberto = true
	header.MouseButton1Click:Connect(function()
		aberto = not aberto
		content.Visible = aberto
		header.Text = (aberto and "▼ " or "► ") .. titulo
	end)

	return content
end

-- Brookhaven
local brookhaven = criarSecao("Brookhaven")
criarBotao("SP Hub (Brookhaven)", "https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven", 6035047409, brookhaven)
criarBotao("Mango Hub", "https://raw.githubusercontent.com/rogelioajax/lua/main/MangoHub", 17045248492, brookhaven)

-- Misc
local misc = criarSecao("Misc")
criarBotao("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", 6031280882, misc)

-- Minimizar Janela
local minimized = false
minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	local goalSize = minimized and UDim2.new(0, 300, 0, config.TopBarHeight + 4) or UDim2.new(0, 300, 0, 400)
	TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), { Size = goalSize }):Play()
end)

-- Fechar Janela
close.MouseButton1Click:Connect(function()
	TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), { Position = UDim2.new(0.5, -150, 1.2, 0) }):Play()
	wait(0.4)
	screenGui:Destroy()
end)

-- Animação de entrada
mainFrame.Position = UDim2.new(0.5, -150, -1, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, -150, 0.5, -200) }):Play()

-- Movimentar
local dragging = false
local offset
topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		offset = Vector2.new(input.Position.X - mainFrame.Position.X.Offset, input.Position.Y - mainFrame.Position.Y.Offset)
	end
end)
topBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
UIS.InputChanged:Connect(function(input)
	if dragging then
		local pos = UIS:GetMouseLocation()
		mainFrame.Position = UDim2.new(0, pos.X - offset.X, 0, pos.Y - offset.Y)
	end
end)
