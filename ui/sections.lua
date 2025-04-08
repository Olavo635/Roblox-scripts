return function(parentWindow, config)
	local UIS = game:GetService("UserInputService")

	-- Scroll Area
	local scrollingFrame = Instance.new("ScrollingFrame", parentWindow)
	scrollingFrame.Size = UDim2.new(1, 0, 1, -config.TopBarHeight - config.Padding)
	scrollingFrame.Position = UDim2.new(0, 0, 0, config.TopBarHeight + config.Padding)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.ScrollBarThickness = 5
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local layout = Instance.new("UIListLayout", scrollingFrame)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, config.Padding)

	-- Seção Brookhaven
	local function createSection(title)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -config.Padding * 2, 0, 30)
		frame.BackgroundColor3 = config.Colors.TopBar
		frame.BorderSizePixel = 0
		frame.LayoutOrder = 0

		local corner = Instance.new("UICorner", frame)
		corner.CornerRadius = config.CornerRadius

		local label = Instance.new("TextLabel", frame)
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Text = "  " .. title
		label.TextColor3 = config.Colors.Text
		label.Font = config.Font
		label.TextSize = 18
		label.TextXAlignment = Enum.TextXAlignment.Left

		return frame
	end

	local function import(path)
		local base = "https://raw.githubusercontent.com/Olavo635/Roblox-scripts/refs/heads/main/"
		return loadstring(game:HttpGet(base .. path, true))()
	end

	local brookhavenSection = createSection("Brookhaven")
	brookhavenSection.Parent = scrollingFrame

	import("scripts/brookhaven.lua")(scrollingFrame, config)

	local miscSection = createSection("Misc")
	miscSection.Parent = scrollingFrame

	import("scripts/misc.lua")(scrollingFrame, config)
end
