-- Configuration
local correctKey = "flyfontop1" 

local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- 1. Key System GUI
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"; keyGui.Parent = pgui; keyGui.ResetOnSpawn = false

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 300, 0, 150); keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); keyFrame.Active = true; keyFrame.Draggable = true; keyFrame.Parent = keyGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40); title.Text = "Script fon fly"; title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1; title.TextSize = 25; title.Font = Enum.Font.SourceSansBold; title.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 200, 0, 35); keyBox.Position = UDim2.new(0.5, -100, 0, 60)
keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35); keyBox.Text = ""; keyBox.TextColor3 = Color3.new(1, 1, 1)
keyBox.PlaceholderText = "Enter key..."; keyBox.BorderSizePixel = 0; keyBox.Parent = keyFrame

local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(0, 120, 0, 35); checkBtn.Position = UDim2.new(0.5, -60, 0, 105)
checkBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45); checkBtn.Text = "Login"; checkBtn.TextColor3 = Color3.new(1, 1, 1)
checkBtn.Font = Enum.Font.SourceSansBold; checkBtn.TextSize = 20; checkBtn.Parent = keyFrame

-- Login Logic
checkBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        keyGui:Destroy()
        
        -- 2. Create Main Fly GUI (Using your exact style)
        local main = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local up = Instance.new("TextButton")
        local down = Instance.new("TextButton")
        local onof = Instance.new("TextButton")
        local TextLabel = Instance.new("TextLabel")
        local plus = Instance.new("TextButton")
        local speedLabel = Instance.new("TextLabel")
        local mine = Instance.new("TextButton")
        local closebutton = Instance.new("TextButton")
        local mini = Instance.new("TextButton")
        local mini2 = Instance.new("TextButton")

        main.Name = "main"; main.Parent = pgui; main.ResetOnSpawn = false
        Frame.Parent = main; Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
        Frame.Position = UDim2.new(0.1, 0, 0.38, 0); Frame.Size = UDim2.new(0, 190, 0, 57); Frame.Active = true; Frame.Draggable = true

        up.Name = "up"; up.Parent = Frame; up.BackgroundColor3 = Color3.fromRGB(79, 255, 152); up.Size = UDim2.new(0, 44, 0, 28); up.Text = "UP"
        down.Name = "down"; down.Parent = Frame; down.BackgroundColor3 = Color3.fromRGB(215, 255, 121); down.Position = UDim2.new(0, 0, 0.49, 0); down.Size = UDim2.new(0, 44, 0, 28); down.Text = "DOWN"
        onof.Name = "onof"; onof.Parent = Frame; onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74); onof.Position = UDim2.new(0.7, 0, 0.49, 0); onof.Size = UDim2.new(0, 56, 0, 28); onof.Text = "fly"
        TextLabel.Parent = Frame; TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255); TextLabel.Position = UDim2.new(0.47, 0, 0, 0); TextLabel.Size = UDim2.new(0, 100, 0, 28); TextLabel.Text = "Fly FON V3"; TextLabel.TextScaled = true
        plus.Name = "plus"; plus.Parent = Frame; plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255); plus.Position = UDim2.new(0.23, 0, 0, 0); plus.Size = UDim2.new(0, 45, 0, 28); plus.Text = "+"
        speedLabel.Name = "speed"; speedLabel.Parent = Frame; speedLabel.BackgroundColor3 = Color3.fromRGB(255, 85, 0); speedLabel.Position = UDim2.new(0.47, 0, 0.49, 0); speedLabel.Size = UDim2.new(0, 44, 0, 28); speedLabel.Text = "1"
        mine.Name = "mine"; mine.Parent = Frame; mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247); mine.Position = UDim2.new(0.23, 0, 0.49, 0); mine.Size = UDim2.new(0, 45, 0, 29); mine.Text = "-"
        closebutton.Name = "Close"; closebutton.Parent = Frame; closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0); closebutton.Size = UDim2.new(0, 45, 0, 28); closebutton.Text = "X"; closebutton.Position = UDim2.new(0, 0, -1, 27)
        mini.Name = "minimize"; mini.Parent = Frame; mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230); mini.Size = UDim2.new(0, 45, 0, 28); mini.Text = "-"; mini.Position = UDim2.new(0, 44, -1, 27)
        mini2.Name = "mini2"; mini2.Parent = Frame; mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230); mini2.Size = UDim2.new(0, 45, 0, 28); mini2.Text = "+"; mini2.Position = UDim2.new(0, 44, -1, 57); mini2.Visible = false

        -- Optimized Fly Variables
        local speeds = 1
        local flying = false
        local cam = workspace.CurrentCamera
        local bg, bv

        local function stopFlying()
            flying = false
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
            local char = player.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then 
                    hum.PlatformStand = false
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
                if char: Greenwich("Animate") then char.Animate.Disabled = false end
            end
            onof.Text = "fly"
        end

        onof.MouseButton1Click:Connect(function()
            if flying then
                stopFlying()
            else
                flying = true
                onof.Text = "ON"
                local char = player.Character
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not root or not hum then return end

                char.Animate.Disabled = true
                hum.PlatformStand = true
                
                bg = Instance.new("BodyGyro", root)
                bg.P = 9e4; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9); bg.cframe = root.CFrame
                
                bv = Instance.new("BodyVelocity", root)
                bv.velocity = Vector3.new(0,0,0); bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

                task.spawn(function()
                    while flying and char.Parent do
                        RunService.RenderStepped:Wait()
                        local moveDir = hum.MoveDirection
                        if moveDir.Magnitude > 0 then
                            bv.velocity = (cam.CFrame.LookVector * (moveDir.Z * -1 * speeds * 30)) + (cam.CFrame.RightVector * (moveDir.X * speeds * 30))
                        else
                            bv.velocity = Vector3.new(0,0,0) -- Fix: Character stays still when idle
                        end
                        bg.cframe = cam.CFrame
                    end
                end)
            end
        end)

        -- Vertical Controls
        local movingUp, movingDn = false, false
        up.MouseButton1Down:Connect(function() movingUp = true; while movingUp do task.wait() player.Character.HumanoidRootPart.CFrame *= CFrame.new(0,1.5,0) end end)
        up.MouseButton1Up:Connect(function() movingUp = false end)
        down.MouseButton1Down:Connect(function() movingDn = true; while movingDn do task.wait() player.Character.HumanoidRootPart.CFrame *= CFrame.new(0,-1.5,0) end end)
        down.MouseButton1Up:Connect(function() movingDn = false end)

        -- Speed Controls
        plus.MouseButton1Click:Connect(function() speeds += 1; speedLabel.Text = tostring(speeds) end)
        mine.MouseButton1Click:Connect(function() if speeds > 1 then speeds -= 1; speedLabel.Text = tostring(speeds) end end)
        
        -- Window Controls
        closebutton.MouseButton1Click:Connect(function() stopFlying(); main:Destroy() end)
        mini.MouseButton1Click:Connect(function()
            for _,v in pairs(Frame:GetChildren()) do if v:IsA("TextButton") or v:IsA("TextLabel") then v.Visible = false end end
            mini2.Visible = true; Frame.BackgroundTransparency = 1; closebutton.Visible = true; closebutton.Position = UDim2.new(0, 0, -1, 57)
        end)
        mini2.MouseButton1Click:Connect(function()
            for _,v in pairs(Frame:GetChildren()) do if v:IsA("TextButton") or v:IsA("TextLabel") then v.Visible = true end end
            mini2.Visible = false; Frame.BackgroundTransparency = 0; closebutton.Position = UDim2.new(0, 0, -1, 27)
        end)

        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Success", Text = "Optimized Fly GUI V3 Loaded", Duration = 3})
    else
        -- Wrong Key Feedback
        keyBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        keyBox.Text = "WRONG KEY X"
        task.wait(1)
        keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        keyBox.Text = ""
    end
end)
