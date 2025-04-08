return function(parent, config)
	local function createButton(name, scriptURL)
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, -config.Padding * 2, 0, 40)
		button.BackgroundColor3 = config.Colors.Button
		button.Text = name
		button.Font = config.Font
		button.TextSize = 16
		button.TextColor3 = config.Colors.Text
		button.BorderSizePixel = 0
		button.AutoButtonColor = true

		local corner = Instance.new("UICorner", button)
		corner.CornerRadius = config.CornerRadius

		button.MouseButton1Click:Connect(function()
			pcall(function()
				loadstring(game:HttpGet(scriptURL, true))()
			end)
		end)

		button.Parent = parent
	end

	createButton("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
end
