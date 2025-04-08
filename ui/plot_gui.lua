return function(config)
	local player = game.Players.LocalPlayer
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "PlotHub"
	gui.ResetOnSpawn = false

	-- Main Window
	local window = Instance.new("Frame", gui)
	window.Name = "MainWindow"
	window.Size = config.WindowSize
	window.Position = UDim2.new(0.5, -config.WindowSize.X.Offset/2, 0.5, -config.WindowSize.Y.Offset/2)
	window.BackgroundColor3 = config.Colors.Background
	window.BorderSizePixel = 0
	window.Active = true
	window.Draggable = true

	local corner = Instance.new("UICorner", window)
	corner.CornerRadius = config.CornerRadius

	-- Top Bar
	local topBar = Instance.new("Frame", window)
	topBar.Size = UDim2.new(1, 0, 0, config.TopBarHeight)
	topBar.BackgroundColor3 = config.Colors.TopBar
	topBar.BorderSizePixel = 0

	local topBarCorner = Instance.new("UICorner", topBar)
	topBarCorner.CornerRadius = UDim.new(0, 8)

	local title = Instance.new("TextLabel", topBar)
	title.Size = UDim2.new(1, -60, 1, 0)
	title.Position = UDim2.new(0, 10, 0, 0)
	title.BackgroundTransparency = 1
	title.Text = config.WindowTitle
	title.Font = config.Font
	title.TextSize = 18
	title.TextColor3 = config.Colors.Text
	title.TextXAlignment = Enum.TextXAlignment.Left

	-- Minimize Button
	local minimize = Instance.new("TextButton", topBar)
	minimize.Text = "-"
	minimize.Size = UDim2.new(0, 25, 0, 25)
	minimize.Position = UDim2.new(1, -55, 0, 2)
	minimize.BackgroundColor3 = config.Colors.Minimize
	minimize.TextColor3 = Color3.new(0,0,0)
	minimize.Font = config.Font
	minimize.TextSize = 18
	minimize.BorderSizePixel = 0
	minimize.AutoButtonColor = true

	-- Close Button
	local close = Instance.new("TextButton", topBar)
	close.Text = "X"
	close.Size = UDim2.new(0, 25, 0, 25)
	close.Position = UDim2.new(1, -30, 0, 2)
	close.BackgroundColor3 = config.Colors.Close
	close.TextColor3 = Color3.new(0,0,0)
	close.Font = config.Font
	close.TextSize = 18
	close.BorderSizePixel = 0
	close.AutoButtonColor = true

	-- Animation: Fechar
	close.MouseButton1Click:Connect(function()
		window:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, config.AnimationSpeed, true, function()
			gui:Destroy()
		end)
	end)

	-- Animation: Minimizar
	local minimized = false
	local originalSize = window.Size

	minimize.MouseButton1Click:Connect(function()
		if minimized then
			window:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, config.AnimationSpeed, true)
		else
			window:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, config.TopBarHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, config.AnimationSpeed, true)
		end
		minimized = not minimized
	end)

	return window
end
