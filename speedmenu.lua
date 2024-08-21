-- Cria um ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Cria um Frame que será a janela em branco com bordas arredondadas
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0) -- Tamanho da janela (50% da largura e altura da tela)
frame.Position = UDim2.new(0.35, 0, 0.35, 0) -- Posição da janela (centralizada na tela)
frame.BackgroundColor3 = Color3.new(1, 1, 1) -- Cor de fundo branca
frame.BorderSizePixel = 0 -- Sem borda
frame.Parent = screenGui

-- Adiciona cantos arredondados ao Frame
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15) -- Ajusta o raio das bordas para arredondar (15 pixels)
uiCorner.Parent = frame

-- Adiciona um botão de fechar no canto superior direito da janela
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Tamanho do botão
closeButton.Position = UDim2.new(1, -35, 0, 5) -- Posição do botão (canto superior direito)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Cor de fundo vermelha
closeButton.Text = "X" -- Texto do botão
closeButton.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto branca
closeButton.Font = Enum.Font.SourceSansBold -- Fonte mais destacada para o botão
closeButton.TextSize = 18 -- Tamanho do texto do botão
closeButton.Parent = frame

-- Adiciona cantos arredondados ao botão de fechar
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8) -- Ajusta o raio das bordas para arredondar (8 pixels)
buttonCorner.Parent = closeButton

-- Função para fechar a janela quando o botão é clicado
closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Variáveis para armazenar estado do arrasto
local dragging = false
local dragInput
local dragStart
local startPos

-- Função para atualizar a posição do frame enquanto ele é arrastado
local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

-- Quando o toque/mouse é pressionado sobre o frame
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

-- Quando o toque/mouse se move
frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

-- Atualiza a posição enquanto o frame está sendo arrastado
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Cria o botão Discord dentro da janela branca
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0, 50, 0, 20) -- Ajusta o tamanho do botão
discordButton.Position = UDim2.new(0, 10, 1, -30) -- Ajusta a posição do botão (inferior esquerdo da janela branca)
discordButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255) -- Cor de fundo azul
discordButton.Text = "Discord" -- Texto do botão
discordButton.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto branca
discordButton.Font = Enum.Font.SourceSans -- Fonte do botão
discordButton.TextSize = 9 -- Ajusta o tamanho do texto do botão
discordButton.Parent = frame -- Adiciona o botão ao Frame

-- Adiciona cantos arredondados ao botão Discord
local discordButtonCorner = Instance.new("UICorner")
discordButtonCorner.CornerRadius = UDim.new(0, 10) -- Ajusta o raio das bordas para arredondar (10 pixels)
discordButtonCorner.Parent = discordButton

-- Cria o botão Speed dentro da janela branca
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0, 50, 0, 25) -- Tamanho do botão (metade do tamanho original)
speedButton.Position = UDim2.new(0, 10, 0.5, -30) -- Posição do botão (lado esquerdo da janela branca)
speedButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128) -- Cor de fundo cinza
speedButton.Text = "Speed" -- Texto do botão
speedButton.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto branca
speedButton.Font = Enum.Font.SourceSans -- Fonte do botão
speedButton.TextSize = 15 -- Ajusta o tamanho do texto do botão
speedButton.Parent = frame -- Adiciona o botão ao Frame

-- Adiciona cantos arredondados ao botão Speed
local speedButtonCorner = Instance.new("UICorner")
speedButtonCorner.CornerRadius = UDim.new(0, 10) -- Ajusta o raio das bordas para arredondar (10 pixels)
speedButtonCorner.Parent = speedButton

-- Cria uma caixa de texto dentro da janela branca
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0, 50, 0, 25) -- Tamanho da caixa de texto (metade do tamanho original)
speedInput.Position = UDim2.new(0, 70, 0.5, -30) -- Posição da caixa de texto (ao lado do botão Speed dentro da janela branca)
speedInput.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Cor de fundo cinza claro
speedInput.Text = "50" -- Texto padrão (valor inicial)
speedInput.TextColor3 = Color3.new(0, 0, 0) -- Cor do texto preto
speedInput.Font = Enum.Font.SourceSans -- Fonte da caixa de texto
speedInput.TextSize = 15 -- Tamanho do texto da caixa de texto
speedInput.Parent = frame -- Adiciona a caixa de texto ao Frame

-- Função para atualizar a velocidade do jogador
local function setSpeed()
    local speedValue = tonumber(speedInput.Text)
    if speedValue then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speedValue
        end
    end
end

-- Conecta a função ao clique do botão Speed
speedButton.MouseButton1Click:Connect(setSpeed)
