-- By LeekGuy https://discord.gg/ndxRJ3vR68
local var33 = (function()
    local _ok, _b = pcall(function()
        return buffer.create(8)
    end)
    if _ok and _b then
        return true
    else
        return false
    end
end)()
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Teams = game:GetService("Teams")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local str = "v1.0.0"
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RillBoys/bolong.catui/refs/heads/main/b0lngUi.lua"))()
if not library then
    error("Library file not found: b0lngUi.lua")
end
local color3 = Color3.fromRGB(255, 112, 24)
local tbl = {}
local fn2 = function(title, content, delayTime) end
local guards = Teams:FindFirstChild("Guards")
local inmates = Teams:FindFirstChild("Inmates")
local criminals = Teams:FindFirstChild("Criminals")
local tbl2 = {
    enabled = true,
    teamcheck = true,
    wallcheck = true,
    deathcheck = true,
    ffcheck = true,
    hostilecheck = true,
    trespasscheck = true,
    vehiclecheck = true,
    criminalsnoinnmates = true,
    inmatesnocriminals = true,
    shieldbreaker = true,
    shieldfrontangle = 0.3,
    shieldrandomhead = true,
    shieldheadchance = 30,
    taserbypasshostile = false,
    taserbypasstrespass = false,
    taseralwayshit = true,
    ifplayerstill = false,
    stillthreshold = 0.5,
    hitchance = 65,
    hitchanceAutoOnly = false,
    distancebasedhitchance = false,
    distancehitchance1dist = 200,
    distancehitchance1value = 30,
    distancehitchance2dist = 350,
    distancehitchance2value = 20,
    distancehitchance3dist = 500,
    distancehitchance3value = 10,
    distancehitchance4dist = 650,
    distancehitchance4value = 5,
    distancehitchance5dist = 800,
    distancehitchance5value = 1,
    autoshoot = false,
    autoshootweapon = "Any",
    autoshootdelay = 0.12,
    autoshootstartdelay = 0.2,
    aimmaxdist = 100,
    missspread = 5,
    shotgunnaturalspread = true,
    shotgungamehandled = false,
    prioritizeclosest = true,
    prioritizecriminals = true,
    targetstickiness = false,
    targetstickinessduration = 0.6,
    targetstickinessrandom = false,
    targetstickinessmin = 0.3,
    targetstickinessmax = 0.7,
    fov = 150,
    showfov = true,
    staticfov = true,
    showtargetline = false,
    togglekey = Enum.KeyCode.RightShift,
    aimpart = "Head",
    randomparts = true,
    partslist = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "HumanoidRootPart"},
    esp = true,
    outlineesp = false,
    ignoreviolenceemoji = false,
    ignorechainemoji = false,
    espteamcheck = true,
    espshowteam = false,
    esptargets = {guards = true, inmates = true, criminals = true},
    espmaxdist = 500,
    espshowdist = true,
    esptoggle = Enum.KeyCode.RightControl,
    espcolor = Color3.fromRGB(0, 170, 255),
    espguards = Color3.fromRGB(0, 170, 255),
    espinmates = Color3.fromRGB(255, 150, 50),
    espcriminals = Color3.fromRGB(255, 60, 60),
    espteam = Color3.fromRGB(60, 255, 60),
    espuseteamcolors = true,
    c4esp = true,
    c4esptoggle = Enum.KeyCode.B,
    c4espcolor = Color3.fromRGB(80, 255, 80),
    c4espmaxdist = 200,
    c4espshowdist = true,
    autograb = true,
    autograbdistance = 12,
    autograbdelay = 1,
    autograbkeycard = true,
    autograbm9 = true,
    teleportdistance = 3,
    num1 = 4,
    hitboxenabled = false,
    fullbright = false,
    hitboxsize = 8,
    flag1 = false,
    flag18 = false,
    autoswitchteam = "Inmates",
    autoswitchfirerate = 0.02,
    autoswitchdistance = 500,
    autoswitchautoreload = true,
    autoswitchwallcheck = true,
    infammo = false,
    autoreloadtazer = false,
    movementwalkspeed = 16,
    movementjumppower = 50,
    movementgravity = Workspace.Gravity,
    movementfov = 70,
    infinityjump = false,
}
local var52 = setmetatable({}, {__mode = "k"})
local var53 = setmetatable({}, {__mode = "k"})
local gravity = Workspace.Gravity
local num = 16
local num2 = 50
local var54 = math.clamp(math.floor((tonumber(Workspace.Gravity) or 196.2) + 0.5), 0, 300)
local num3 = 70
local flag = false
local flag2 = false
local flag3 = false
local flag4 = false
local num4 = 70
local var59
local var60
local function fn3()
    local character = localPlayer.Character
    return character and character:FindFirstChildOfClass("Humanoid") or nil
end
local function fn4(arg2)
    if not arg2 or var52[arg2] then
        return
    end
    var52[arg2] = {
        WalkSpeed = arg2.WalkSpeed,
        JumpPower = arg2.JumpPower,
        JumpHeight = arg2.JumpHeight,
        UseJumpPower = arg2.UseJumpPower,
    }
end
local function fn5(arg3)
    if not arg3 or var53[arg3] ~= nil then
        return
    end
    var53[arg3] = arg3.FieldOfView
end
local function fn6(arg4)
    local var64 = arg4 and var52[arg4]
    if not arg4 or not var64 then
        return
    end
    pcall(function()
        arg4.UseJumpPower = var64.UseJumpPower
        arg4.JumpPower = var64.JumpPower
        arg4.JumpHeight = var64.JumpHeight
    end)
end
do
    local var65 = fn3()
    if var65 then
        fn4(var65)
        num = math.clamp(math.floor((tonumber(var65.WalkSpeed) or 16) + 0.5), 16, 200)
        num2 = math.clamp(math.floor((tonumber(var65.JumpPower) or 50) + 0.5), 50, 300)
        tbl2.movementwalkspeed = num
        tbl2.movementjumppower = num2
    end
    gravity = Workspace.Gravity
    tbl2.movementgravity = var54
    local currentCamera = Workspace.CurrentCamera
    if currentCamera then
        fn5(currentCamera)
        num4 = currentCamera.FieldOfView
        num3 = math.clamp(math.floor((tonumber(currentCamera.FieldOfView) or 70) + 0.5), 70, 120)
    end
    tbl2.movementfov = num3
end
local function fn7(key, value)
    local var69 = tonumber(value)
    if not var69 then
        return
    end
    if key == "movementwalkspeed" then
        local var70 = math.clamp(var69, 16, 200)
        flag = math.abs(var70 - num) > 0.01
        local var71 = fn3()
        if var71 then
            fn4(var71)
            if flag then
                pcall(function()
                    var71.WalkSpeed = var70
                end)
            else
                local var73 = var52[var71]
                if var73 then
                    pcall(function()
                        var71.WalkSpeed = var73.WalkSpeed
                    end)
                end
            end
        end
    elseif key == "movementjumppower" then
        local var75 = math.clamp(var69, 50, 300)
        flag4 = math.abs(var75 - num2) > 0.01
        local var77 = fn3()
        if var77 then
            fn4(var77)
            if flag4 then
                pcall(function()
                    var77.UseJumpPower = true
                    var77.JumpPower = var75
                end)
            else
                fn6(var77)
            end
        end
    elseif key == "movementgravity" then
        local var78 = math.clamp(var69, 0, 300)
        flag2 = math.abs(var78 - var54) > 0.5
        pcall(function()
            Workspace.Gravity = flag2 and var78 or gravity
        end)
    elseif key == "movementfov" then
        local var79 = math.clamp(var69, 70, 120)
        flag3 = math.abs(var79 - num3) > 0.01
        local currentCamera2 = Workspace.CurrentCamera
        if currentCamera2 then
            fn5(currentCamera2)
            local var82 = var53[currentCamera2] or num4
            pcall(function()
                currentCamera2.FieldOfView = flag3 and var79 or var82
            end)
        end
    end
end
local function fn8(section, title, content)
    pcall(function()
        section:AddLabel({Title = title, Content = content or ""})
    end)
end
local function fn9(section, key, title, targetTable)
    local var85
    if targetTable then
        var85 = targetTable[key]
    else
        var85 = tbl2[key]
    end
    local var86, var87 = pcall(function()
        return section:AddToggle({
            Title = title,
            Default = var85 == true,
            Callback = function(value)
                if targetTable then
                    targetTable[key] = value == true
                else
                    tbl2[key] = value == true
                end
                if not targetTable and key == "fullbright" and var59 then
                    var59(tbl2.fullbright)
                end
            end,
        })
    end)
    if var86 and var87 then
        tbl[key] = var87
    else
        fn8(section, title, "This control was not supported by the loaded BOLONG UI build.")
    end
end
local function fn10(section, key, title, minValue, maxValue, increment, note)
    local var90, var91 = pcall(function()
        return section:AddSlider({
            Title = title,
            Min = minValue,
            Max = maxValue,
            Default = math.clamp(tonumber(tbl2[key]) or minValue, minValue, maxValue),
            Increment = increment,
            Callback = function(value)
                local var89 = tonumber(value)
                if var89 then
                    tbl2[key] = math.clamp(var89, minValue, maxValue)
                    if string.sub(tostring(key), 1, 8) == "movement" then
                        fn7(key, tbl2[key])
                    end
                end
            end,
        })
    end)
    if not var90 or not var91 then
        fn8(section, title, note or "Current value: " .. tostring(tbl2[key]))
    elseif note then
        fn8(section, "Info", note)
    end
end
local function fn11(value, options)
    if type(value) == "number" then
        return options[value] or options[value + 1] or options[1]
    end
    return value
end
local function fn12(section, key, title, options, defaultValue, callback)
    local function fn13(value)
        value = fn11(value, options)
        if callback then
            callback(value)
        elseif key then
            tbl2[key] = value
        end
    end
    local var96, var97 = pcall(function()
        return section:AddDropdown({Title = title, Options = options, Default = defaultValue, Callback = fn13})
    end)
    if not var96 or not var97 then
        var96, var97 = pcall(function()
            return section:AddDropdown({Title = title, Values = options, Default = defaultValue, Callback = fn13})
        end)
    end
    if var96 and var97 then
        if key then
            tbl[key] = var97
        end
    else
        fn8(section, title, "Current value: " .. tostring(defaultValue))
    end
end
local function fn14(section, key, title)
    local function fn15(arg5)
        if typeof(arg5) == "Color3" then
            tbl2[key] = arg5
        end
    end
    local var99, var100 = pcall(function()
        return section:AddColorPicker({Title = title, Default = tbl2[key], Callback = fn15})
    end)
    if not var99 or not var100 then
        var99, var100 = pcall(function()
            return section:AddColorpicker({Title = title, Default = tbl2[key], Callback = fn15})
        end)
    end
    if var99 and var100 then
        tbl[key] = var100
        return
    end
    local var104 = tbl2[key]
    local tbl3 = {
        {name = "R", channel = "R", default = math.floor(var104.R * 255 + 0.5)},
        {name = "G", channel = "G", default = math.floor(var104.G * 255 + 0.5)},
        {name = "B", channel = "B", default = math.floor(var104.B * 255 + 0.5)},
    }
    for _, v in ipairs(tbl3) do
        local var105 = key .. "_" .. v.channel
        pcall(function()
            section:AddSlider({
                Title = title .. " " .. v.name,
                Min = 0,
                Max = 255,
                Default = v.default,
                Increment = 1,
                Callback = function(value)
                    local R, g, b = tbl2[key].R, tbl2[key].G, tbl2[key].B
                    if v.channel == "R" then
                        R = math.clamp(value, 0, 255) / 255
                    end
                    if v.channel == "G" then
                        g = math.clamp(value, 0, 255) / 255
                    end
                    if v.channel == "B" then
                        b = math.clamp(value, 0, 255) / 255
                    end
                    tbl2[key] = Color3.new(R, g, b)
                end,
            })
        end)
    end
end
local function fn16(section, key, title)
    local var108 = tbl2[key] or Enum.KeyCode.Unknown
    local var109, var110 = pcall(function()
        return section:AddKeybind({
            Title = title,
            Content = "Click the key box, then press a key",
            Default = var108,
            Callback = function(keyCode)
                if typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode then
                    tbl2[key] = keyCode
                end
            end,
        })
    end)
    if var109 and var110 then
        tbl[key] = var110
        if typeof(var110.Value) == "EnumItem" and var110.Value.EnumType == Enum.KeyCode and var110.Value ~= Enum.KeyCode.Unknown then
            tbl2[key] = var110.Value
        end
        return
    end
    local tbl4 = {
        "RightShift",
        "LeftShift",
        "RightControl",
        "LeftControl",
        "Insert",
        "Home",
        "End",
        "Delete",
        "F",
        "G",
        "H",
        "J",
        "K",
        "L",
        "Q",
        "E",
        "R",
        "T",
        "Y",
        "U",
        "I",
        "O",
        "P",
        "A",
        "S",
        "D",
        "W",
        "Z",
        "X",
        "C",
        "V",
        "B",
        "N",
        "M",
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
    }
    local name2 = var108.Name
    fn12(section, key, title, tbl4, name2, function(value)
        local var113 = Enum.KeyCode[tostring(value)]
        if var113 then
            tbl2[key] = var113
        end
    end)
end
local function fn17(section, partName)
    local enabled = table.find(tbl2.partslist, partName) ~= nil
    pcall(function()
        section:AddToggle({
            Title = "Random part: " .. partName,
            Default = enabled,
            Callback = function(value)
                local var114 = table.find(tbl2.partslist, partName)
                if value and not var114 then
                    table.insert(tbl2.partslist, partName)
                elseif not value and var114 then
                    table.remove(tbl2.partslist, var114)
                end
                if #tbl2.partslist == 0 then
                    table.insert(tbl2.partslist, "Head")
                end
            end,
        })
    end)
end
local function fn18(key, value)
    local var115 = tbl[key]
    if not var115 then
        return
    end
    for _, v2 in ipairs({"SetValue", "Set", "SetState"}) do
        local var116, method = pcall(function()
            return var115[v2]
        end)
        if var116 and type(method) == "function" then
            local var118 = pcall(function()
                method(var115, value)
            end)
            if var118 then
                return
            end
        end
    end
end
local var119 = nil
local var121 = nil
local flag5 = false
local flag6 = false
local var122
local var123
local var124
local var125
local var126 = nil
local var127 = nil
local function fn19()
    if var121 then
        local var128 = math.clamp(tonumber(tbl2.num1) or 4, 4, 10)
        local var129 = var128 * 15
        var121.Size = UDim2.fromOffset(var129, var129)
    end
end
local function fn20()
    if flag6 then
        return
    end
    local character = localPlayer.Character
    local var130 = character and character:FindFirstChild("HumanoidRootPart")
    local var131 = character and character:FindFirstChildOfClass("Humanoid")
    if not var130 or not var131 or var131.Health <= 0 then
        fn2("Teleport Forward", "Character is not ready.", 2)
        return
    end
    local distance = math.clamp(tonumber(tbl2.teleportdistance) or 3, 2, 10)
    local cFrame = var130.CFrame
    local var132 = cFrame + cFrame.LookVector * distance
    local tweenInfo = TweenInfo.new(0.055, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local var133, tween = pcall(function()
        return TweenService:Create(var130, tweenInfo, {CFrame = var132})
    end)
    if not var133 or not tween then
        fn2("Teleport Forward", "Could not start the movement tween.", 2)
        return
    end
    flag6 = true
    local var134
    var134 = tween.Completed:Connect(function()
        if var134 then
            var134:Disconnect()
        end
        flag6 = false
    end)
    tween:Play()
end
local function fn21()
    if var121 and var121.Parent then
        return
    end
    local var140
    pcall(function()
        local var141 = type(gethui) == "function" and gethui() or CoreGui
        var140 = var141:FindFirstChild("BOLONG_TeleportPanel")
        if not var140 then
            var140 = CoreGui:FindFirstChild("BOLONG_TeleportPanel")
        end
    end)
    if var140 then
        pcall(function()
            var140:Destroy()
        end)
    end
    local var142 = CoreGui
    pcall(function()
        if type(gethui) == "function" then
            var142 = gethui()
        end
    end)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BOLONG_TeleportPanel"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = var142
    local textButton = Instance.new("TextButton")
    textButton.Name = "TeleportButton"
    textButton.AnchorPoint = Vector2.new(0, 0)
    textButton.Position = UDim2.new(1, -84, 0.5, -30)
    textButton.Size = UDim2.fromOffset(60, 60)
    textButton.BackgroundColor3 = Color3.fromRGB(48, 22, 8)
    textButton.BackgroundTransparency = 0.77
    textButton.BorderSizePixel = 0
    textButton.AutoButtonColor = false
    textButton.Active = true
    textButton.Text = "Teleport"
    textButton.TextColor3 = Color3.fromRGB(255, 178, 92)
    textButton.TextSize = 13
    textButton.TextWrapped = true
    textButton.Font = Enum.Font.GothamBold
    textButton.Visible = flag5
    textButton.Parent = screenGui
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 10)
    uICorner.Parent = textButton
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Name = "Outline"
    uIStroke.Color = Color3.fromRGB(255, 112, 24)
    uIStroke.Thickness = 2
    uIStroke.Transparency = 0
    uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke.Parent = textButton
    var119 = screenGui
    var121 = textButton
    fn19()
    local flag7 = false
    local var157 = nil
    local var160 = nil
    local var161 = nil
    local flag8 = false
    local flag9 = false
    textButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            flag7 = true
            flag8 = false
            var160 = input.Position
            var161 = textButton.Position
            var157 = input.UserInputType == Enum.UserInputType.Touch and input or nil
        end
    end)
    textButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            var157 = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not flag7 or not var160 or not var161 then
            return
        end
        if var157 and input == var157 then
            local var164 = input.Position - var160
            if var164.Magnitude >= 6 then
                flag8 = true
                textButton.Position = UDim2.new(var161.X.Scale, var161.X.Offset + var164.X, var161.Y.Scale, var161.Y.Offset + var164.Y)
            end
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        local var165 = input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
        if flag7 and var165 then
            flag7 = false
            var157 = nil
            var160 = nil
            var161 = nil
            if flag8 then
                flag9 = true
                task.delay(0.15, function()
                    flag9 = false
                end)
            end
        end
    end)
    textButton.Activated:Connect(function()
        if flag9 or flag8 then
            flag9 = false
            return
        end
        fn20()
    end)
end
var122 = function(enabled)
    flag5 = enabled == true
    if flag5 then
        fn21()
        if var119 then
            var119.Enabled = true
        end
        if var121 then
            var121.Visible = true
        end
    else
        if var121 then
            var121.Visible = false
        end
        if var119 then
            var119.Enabled = false
        end
    end
end
local function fn22()
    if not var127 then
        return
    end
    var127.Text = tbl2.flag18 and "ON" or "FIRE"
    var127.TextColor3 = Color3.fromRGB(255, 178, 92)
end
local function fn23()
    if var127 and var127.Parent then
        return
    end
    local var168 = CoreGui
    pcall(function()
        if type(gethui) == "function" then
            var168 = gethui()
        end
    end)
    pcall(function()
        local bOLONG_AutoShootSwitchPanel = var168:FindFirstChild("BOLONG_AutoShootSwitchPanel")
        if bOLONG_AutoShootSwitchPanel then
            bOLONG_AutoShootSwitchPanel:Destroy()
        end
    end)
    local screenGui2 = Instance.new("ScreenGui")
    screenGui2.Name = "BOLONG_AutoShootSwitchPanel"
    screenGui2.ResetOnSpawn = false
    screenGui2.IgnoreGuiInset = true
    screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui2.Parent = var168
    local textButton2 = Instance.new("TextButton")
    textButton2.Name = "SwitchShootButton"
    textButton2.AnchorPoint = Vector2.new(0, 0)
    textButton2.Position = UDim2.new(1, -68, 0.5, -25)
    textButton2.Size = UDim2.fromOffset(50, 50)
    textButton2.BackgroundColor3 = Color3.fromRGB(48, 22, 8)
    textButton2.BackgroundTransparency = 0.77
    textButton2.BorderSizePixel = 0
    textButton2.AutoButtonColor = false
    textButton2.Active = true
    textButton2.Text = "FIRE"
    textButton2.TextColor3 = Color3.fromRGB(255, 178, 92)
    textButton2.TextSize = 11
    textButton2.Font = Enum.Font.GothamBold
    textButton2.Parent = screenGui2
    local uICorner2 = Instance.new("UICorner")
    uICorner2.CornerRadius = UDim.new(0, 10)
    uICorner2.Parent = textButton2
    local uIStroke2 = Instance.new("UIStroke")
    uIStroke2.Name = "Outline"
    uIStroke2.Color = Color3.fromRGB(255, 112, 24)
    uIStroke2.Thickness = 2
    uIStroke2.Transparency = 0
    uIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uIStroke2.Parent = textButton2
    var126 = screenGui2
    var127 = textButton2
    fn22()
    local flag10 = false
    local var173 = nil
    local var176 = nil
    local var177 = nil
    local flag11 = false
    local flag12 = false
    textButton2.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            flag10 = true
            var173 = input.Position
            var176 = textButton2.Position
            var177 = input.UserInputType == Enum.UserInputType.Touch and input or nil
            flag11 = false
        end
    end)
    textButton2.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if input.UserInputType == Enum.UserInputType.Touch then
                var177 = input
            end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not flag10 or not var173 or not var176 then
            return
        end
        local var178 = input.UserInputType == Enum.UserInputType.MouseMovement or var177 ~= nil and input == var177
        if not var178 then
            return
        end
        local var179 = input.Position - var173
        if var179.Magnitude >= 6 then
            flag11 = true
            textButton2.Position = UDim2.new(var176.X.Scale, var176.X.Offset + var179.X, var176.Y.Scale, var176.Y.Offset + var179.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        local var180 = input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
        if flag10 and var180 then
            flag10 = false
            var173 = nil
            var176 = nil
            var177 = nil
            if flag11 then
                flag12 = true
                task.delay(0.15, function()
                    flag12 = false
                end)
            end
        end
    end)
    textButton2.Activated:Connect(function()
        if flag12 or flag11 then
            flag12 = false
            return
        end
        tbl2.flag18 = not tbl2.flag18
        if tbl2.flag18 then
            if var124 then
                var124()
            end
        else
            if var125 then
                var125()
            end
        end
        fn22()
    end)
end
var123 = function(enabled)
    tbl2.flag1 = enabled == true
    if tbl2.flag1 then
        fn23()
        if var126 then
            var126.Enabled = true
        end
        if var127 then
            var127.Visible = true
        end
    else
        tbl2.flag18 = false
        if var125 then
            var125()
        end
        if var127 then
            var127.Visible = false
        end
        if var126 then
            var126.Enabled = false
        end
        fn22()
    end
end
local tbl5 = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
}
local var186 = nil
local function fn24()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
end
var59 = function(enabled)
    tbl2.fullbright = enabled == true
    if tbl2.fullbright then
        if var186 then
            var186:Disconnect()
            var186 = nil
        end
        fn24()
        var186 = RunService.RenderStepped:Connect(function()
            if tbl2.fullbright then
                pcall(fn24)
            end
        end)
    else
        if var186 then
            var186:Disconnect()
            var186 = nil
        end
        pcall(function()
            Lighting.Brightness = tbl5.Brightness
            Lighting.ClockTime = tbl5.ClockTime
            Lighting.FogEnd = tbl5.FogEnd
            Lighting.GlobalShadows = tbl5.GlobalShadows
            Lighting.Ambient = tbl5.Ambient
            Lighting.OutdoorAmbient = tbl5.OutdoorAmbient
        end)
    end
end
local function fn25()
    local var193 = library:Window({
        Title = "BOLONG-HUB",
        Image = "84034353458936",
        Footer = "Prison Life",
        Author = "Discord.gg/pWpgqVGxNK",
        Color = color3,
        Version = str,
        Search = true,
        Folder = "BolongHub",
    })
    var193:InfoTab({
        Name = "Info",
        Icon = "info",
        SectionTitle = "Information",
        Banner = "79662603577585",
        BannerAspectRatio = 3.2,
        Version = str,
        DiscordLink = (function()
            if var33 and buffer then
                local _bf = buffer.create(29)
                local _by = {
                    104,
                    116,
                    116,
                    112,
                    115,
                    58,
                    47,
                    47,
                    100,
                    105,
                    115,
                    99,
                    111,
                    114,
                    100,
                    46,
                    103,
                    103,
                    47,
                    112,
                    87,
                    112,
                    103,
                    113,
                    86,
                    71,
                    120,
                    78,
                    75,
                }
                for _i = 1, #_by do
                    buffer.writeu8(_bf, _i - 1, _by[_i])
                end
                local _s = {}
                for _i = 1, #_by do
                    _s[_i] = string.char(buffer.readu8(_bf, _i - 1))
                end
                return table.concat(_s)
            else
                local _by = {
                    104,
                    116,
                    116,
                    112,
                    115,
                    58,
                    47,
                    47,
                    100,
                    105,
                    115,
                    99,
                    111,
                    114,
                    100,
                    46,
                    103,
                    103,
                    47,
                    112,
                    87,
                    112,
                    103,
                    113,
                    86,
                    71,
                    120,
                    78,
                    75,
                }
                local _s = {}
                for _i = 1, #_by do
                    _s[_i] = string.char(_by[_i])
                end
                return table.concat(_s)
            end
        end)(),
        DiscordName = "Community BolongHub",
        DiscordText = (function()
            if var33 and buffer then
                local _bf = buffer.create(30)
                local _by = {
                    71,
                    97,
                    98,
                    117,
                    110,
                    103,
                    32,
                    117,
                    110,
                    116,
                    117,
                    107,
                    32,
                    117,
                    112,
                    100,
                    97,
                    116,
                    101,
                    32,
                    38,
                    32,
                    115,
                    117,
                    112,
                    112,
                    111,
                    114,
                    116,
                    46,
                }
                for _i = 1, #_by do
                    buffer.writeu8(_bf, _i - 1, _by[_i])
                end
                local _s = {}
                for _i = 1, #_by do
                    _s[_i] = string.char(buffer.readu8(_bf, _i - 1))
                end
                return table.concat(_s)
            else
                local _by = {
                    71,
                    97,
                    98,
                    117,
                    110,
                    103,
                    32,
                    117,
                    110,
                    116,
                    117,
                    107,
                    32,
                    117,
                    112,
                    100,
                    97,
                    116,
                    101,
                    32,
                    38,
                    32,
                    115,
                    117,
                    112,
                    112,
                    111,
                    114,
                    116,
                    46,
                }
                local _s = {}
                for _i = 1, #_by do
                    _s[_i] = string.char(_by[_i])
                end
                return table.concat(_s)
            end
        end)(),
        DiscordDesc = "Made by 11rill — features: Killer & Survivor Hitbox/ESP, Auto Aim, Auto Generator, Killer Warn, Camera Veil, and many more.",
        CardsWidget = {{catwidget = "rbxassetid://117486345000318"}},
    })
    local var194 = var193:AddTab({Name = "Main", Icon = "house"})
    local var196 = var193:AddTab({Name = "Movement", Icon = "move"})
    local var197 = var193:AddTab({Name = "Combat", Icon = "crosshair"})
    local var198 = var193:AddTab({Name = "Visuals", Icon = "eye"})
    local var199 = var193:AddTab({Name = "Configs", Icon = "settings"})
    local var200 = var194:AddSection("Teleport Forward", nil)
    local var201, toggleControl = pcall(function()
        return var200:AddToggle({
            Title = "Teleport Forward",
            Default = false,
            Callback = function(value)
                var122(value == true)
            end,
        })
    end)
    if var201 and toggleControl then
        tbl.teleportPanelEnabled = toggleControl
    else
        fn8(var200, "Teleport Forward", "This toggle was not supported by the loaded BOLONG UI build.")
    end
    fn10(var200, "teleportdistance", "Teleport distance (studs)", 2, 10, 1)
    local var202 = pcall(function()
        var200:AddSlider({
            Title = "Teleport panel size (4 = 60x60)",
            Min = 4,
            Max = 10,
            Default = 4,
            Increment = 1,
            Callback = function(value)
                tbl2.num1 = math.clamp(tonumber(value) or 4, 4, 10)
                fn19()
            end,
        })
    end)
    if not var202 then
        fn8(var200, "Teleport panel size", "Default: 60x60 px. Adjustable from 4 to 10 units when slider support is available.")
    end
    fn8(var200, "Teleport panel", "Tap Teleport to move forward. Drag the square to reposition it.")
    local var203 = var194:AddSection("Hitbox Expander", nil)
    fn9(var203, "hitboxenabled", "Hitbox Expander")
    fn10(var203, "hitboxsize", "Hitbox size", 1, 30, 1)
    local var205 = var194:AddSection("Fullbright", nil)
    fn9(var205, "fullbright", "Fullbright")
    local var206 = var194:AddSection("Auto Grab", nil)
    fn9(var206, "autograb", "Auto Grab keycards / M9")
    fn9(var206, "autograbkeycard", "Grab keycards")
    fn9(var206, "autograbm9", "Grab M9")
    fn10(var206, "autograbdistance", (function()
        if var33 and buffer then
            local _bf = buffer.create(30)
            local _by = {
                80,
                105,
                99,
                107,
                117,
                112,
                32,
                100,
                105,
                115,
                116,
                97,
                110,
                99,
                101,
                32,
                40,
                109,
                97,
                120,
                32,
                49,
                50,
                32,
                115,
                116,
                117,
                100,
                115,
                41,
            }
            for _i = 1, #_by do
                buffer.writeu8(_bf, _i - 1, _by[_i])
            end
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(buffer.readu8(_bf, _i - 1))
            end
            return table.concat(_s)
        else
            local _by = {
                80,
                105,
                99,
                107,
                117,
                112,
                32,
                100,
                105,
                115,
                116,
                97,
                110,
                99,
                101,
                32,
                40,
                109,
                97,
                120,
                32,
                49,
                50,
                32,
                115,
                116,
                117,
                100,
                115,
                41,
            }
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(_by[_i])
            end
            return table.concat(_s)
        end
    end)(), 0, 12, 0.5)
    fn10(var206, "autograbdelay", "Required item delay", 0, 5, 0.1)
    local var208 = var196:AddSection("Movement & Physics", nil)
    fn10(var208, "movementwalkspeed", "Speed", 16, 200, 1)
    fn10(var208, "movementjumppower", "JumpPower", 50, 300, 1)
    fn10(var208, "movementgravity", "Gravity", 0, 300, 1)
    fn10(var208, "movementfov", "FOV", 70, 120, 1)
    fn8(var208, "Restore behavior", "Returning a slider to its initial value restores the original Humanoid, Gravity, or camera value captured by this script.")
    local var210 = var196:AddSection("Utilities", nil)
    fn9(var210, "infinityjump", "Inf Jump")
    fn8(var210, "Utilities", "Inf Jump supports keyboard and touch jump input.")
    local var211 = var197:AddSection("Silent Aim", nil)
    fn9(var211, "enabled", "Enable Silent Aim")
    fn9(var211, "autoshoot", "Auto Shoot")
    fn8(var211, "Info", "Must Enable Silence aim First")
    fn10(var211, "aimmaxdist", "Auto Shoot target max distance (studs)", 0, 1000, 10)
    fn12(var211, "autoshootweapon", "Weapon filter", {
        "Any",
        "Taser",
        "M9",
        "AK-47",
        "M4A1",
        "Remington 870",
        "Revolver",
        "Shotgun",
        "Sniper",
        "Automatic",
    }, tbl2.autoshootweapon)
    fn10(var211, "autoshootdelay", "Delay between shots", 0.03, 2, 0.01)
    fn10(var211, "autoshootstartdelay", "Target acquire delay", 0, 2, 0.01)
    fn10(var211, "fov", "FOV radius", 1, 600, 1)
    fn9(var211, "showfov", "Show FOV circle")
    fn9(var211, "staticfov", "Keep FOV centered")
    fn9(var211, "showtargetline", "Show target line")
    fn16(var211, "togglekey", "Silent Aim hotkey")
    fn9(var211, "prioritizeclosest", (function()
        if var33 and buffer then
            local _bf = buffer.create(28)
            local _by = {
                80,
                114,
                105,
                111,
                114,
                105,
                116,
                105,
                122,
                101,
                32,
                99,
                108,
                111,
                115,
                101,
                115,
                116,
                32,
                116,
                111,
                32,
                99,
                117,
                114,
                115,
                111,
                114,
            }
            for _i = 1, #_by do
                buffer.writeu8(_bf, _i - 1, _by[_i])
            end
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(buffer.readu8(_bf, _i - 1))
            end
            return table.concat(_s)
        else
            local _by = {
                80,
                114,
                105,
                111,
                114,
                105,
                116,
                105,
                122,
                101,
                32,
                99,
                108,
                111,
                115,
                101,
                115,
                116,
                32,
                116,
                111,
                32,
                99,
                117,
                114,
                115,
                111,
                114,
            }
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(_by[_i])
            end
            return table.concat(_s)
        end
    end)())
    fn9(var211, "prioritizecriminals", "Prioritize criminals")
    fn9(var211, "targetstickiness", "Keep target briefly")
    fn9(var211, "targetstickinessrandom", "Random target-stick duration")
    fn10(var211, "targetstickinessduration", "Target-stick duration", 0.05, 3, 0.05)
    fn10(var211, "targetstickinessmin", "Random duration minimum", 0.05, 3, 0.05)
    fn10(var211, "targetstickinessmax", "Random duration maximum", 0.05, 3, 0.05)
    fn8(var211, "Ignored Shoot", "Applies to Auto Shoot and Silent Aim. Normal guns ignore matching names; Taser/Tazer still works.")
    fn9(var211, "ignoreviolenceemoji", "Ignored Shoot 💢")
    fn8(var211, "Info", "Taser Still Works")
    fn9(var211, "ignorechainemoji", "Ignored Shoot ⛓️‍💥")
    fn8(var211, "Info", "Taser Still Works")
    local var216 = var197:AddSection("Auto Shoot Switch Guns", nil)
    local var217, switchPanelToggle = pcall(function()
        return var216:AddToggle({
            Title = "Auto Shoot Switch Guns",
            Default = tbl2.flag1,
            Callback = function(value)
                var123(value == true)
            end,
        })
    end)
    if var217 and switchPanelToggle then
        tbl.flag1 = switchPanelToggle
    else
        fn8(var216, "Auto Shoot Switch Guns", "This toggle was not supported by the loaded BOLONG UI build.")
    end
    fn12(var216, "autoswitchteam", "Target team", {"Inmates", "Police", "Criminal"}, tbl2.autoswitchteam)
    fn10(var216, "autoswitchfirerate", "Fire interval (seconds)", 0.01, 1, 0.005)
    fn10(var216, "autoswitchdistance", "Target range (studs)", 25, 1200, 25)
    fn9(var216, "autoswitchautoreload", "Auto reload empty guns")
    fn8(var216, "Panel", "Enable the toggle to show the 50x50 panel, then tap FIRE to start or stop switching guns and shooting. Only Taser/Tazer are skipped; M9 is included.")
    fn9(var216, "autoswitchwallcheck", "Wall check (Switch Guns)")
    fn9(var216, "infammo", "Inf Ammo")
    fn8(var216, "Info", "Only Works with Auto Shoot Switch Guns")
    local var219 = var197:AddSection("Ammo", nil)
    fn9(var219, "autoreloadtazer", "Auto Reload Tazer")
    local var220 = var197:AddSection("Accuracy & Behaviour", nil)
    fn10(var220, "hitchance", "Hit chance (%)", 0, 100, 1)
    fn9(var220, "hitchanceAutoOnly", "Apply hit chance to automatic weapons only")
    fn9(var220, "distancebasedhitchance", "Distance-based hit chance")
    fn10(var220, "distancehitchance1dist", "Distance breakpoint 1", 25, 1000, 5)
    fn10(var220, "distancehitchance1value", "Hit chance at breakpoint 1 (%)", 0, 100, 1)
    fn10(var220, "distancehitchance2dist", "Distance breakpoint 2", 25, 1000, 5)
    fn10(var220, "distancehitchance2value", "Hit chance at breakpoint 2 (%)", 0, 100, 1)
    fn10(var220, "distancehitchance3dist", "Distance breakpoint 3", 25, 1000, 5)
    fn10(var220, "distancehitchance3value", "Hit chance at breakpoint 3 (%)", 0, 100, 1)
    fn10(var220, "distancehitchance4dist", "Distance breakpoint 4", 25, 1000, 5)
    fn10(var220, "distancehitchance4value", "Hit chance at breakpoint 4 (%)", 0, 100, 1)
    fn10(var220, "distancehitchance5dist", "Distance breakpoint 5", 25, 1200, 5)
    fn10(var220, "distancehitchance5value", "Hit chance at breakpoint 5 (%)", 0, 100, 1)
    fn10(var220, "missspread", "Miss spread", 0, 25, 0.5)
    fn9(var220, "shotgunnaturalspread", "Natural shotgun spread")
    fn9(var220, "shotgungamehandled", "Let game handle shotgun spread")
    fn9(var220, "taseralwayshit", "Taser always hits")
    fn9(var220, "ifplayerstill", (function()
        if var33 and buffer then
            local _bf = buffer.create(29)
            local _by = {
                65,
                108,
                119,
                97,
                121,
                115,
                32,
                104,
                105,
                116,
                32,
                115,
                116,
                97,
                116,
                105,
                111,
                110,
                97,
                114,
                121,
                32,
                116,
                97,
                114,
                103,
                101,
                116,
                115,
            }
            for _i = 1, #_by do
                buffer.writeu8(_bf, _i - 1, _by[_i])
            end
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(buffer.readu8(_bf, _i - 1))
            end
            return table.concat(_s)
        else
            local _by = {
                65,
                108,
                119,
                97,
                121,
                115,
                32,
                104,
                105,
                116,
                32,
                115,
                116,
                97,
                116,
                105,
                111,
                110,
                97,
                114,
                121,
                32,
                116,
                97,
                114,
                103,
                101,
                116,
                115,
            }
            local _s = {}
            for _i = 1, #_by do
                _s[_i] = string.char(_by[_i])
            end
            return table.concat(_s)
        end
    end)())
    fn10(var220, "stillthreshold", "Stationary movement threshold", 0, 5, 0.1)
    fn9(var220, "shieldbreaker", "Shield breaker targeting")
    fn10(var220, "shieldfrontangle", "Shield front angle", -1, 1, 0.05)
    fn9(var220, "shieldrandomhead", "Randomly aim at head around shield")
    fn10(var220, "shieldheadchance", "Head chance around shield (%)", 0, 100, 1)
    local var226 = var197:AddSection("Body Part behaviour", nil)
    fn9(var226, "randomparts", "Random body parts")
    fn12(var226, "aimpart", "Aim part", {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "HumanoidRootPart"}, tbl2.aimpart)
    fn17(var226, "Head")
    fn17(var226, "Torso")
    fn17(var226, "Left Arm")
    fn17(var226, "Right Arm")
    fn17(var226, "Left Leg")
    fn17(var226, "Right Leg")
    fn17(var226, "HumanoidRootPart")
    local var229 = var197:AddSection("Target Filters", nil)
    fn9(var229, "teamcheck", "Skip same team")
    fn9(var229, "wallcheck", "Wall check")
    fn9(var229, "deathcheck", "Skip dead players")
    fn9(var229, "ffcheck", "Skip ForceField players")
    fn9(var229, "hostilecheck", "Hostile check (Guards)")
    fn9(var229, "trespasscheck", "Trespass check (Guards)")
    fn9(var229, "vehiclecheck", "Skip players in vehicles")
    fn9(var229, "criminalsnoinnmates", "Criminals skip Inmates")
    fn9(var229, "inmatesnocriminals", "Inmates skip Criminals")
    fn9(var229, "taserbypasshostile", "Taser bypasses hostile check")
    fn9(var229, "taserbypasstrespass", "Taser bypasses trespass check")
    local var233 = var198:AddSection("Outline", nil)
    fn9(var233, "outlineesp", "Outline ESP")
    local var234 = var198:AddSection("Player ESP", nil)
    fn9(var234, "esp", "Player ESP")
    fn9(var234, "espteamcheck", "Team filter")
    fn9(var234, "espshowteam", "Show teammates")
    fn9(var234, "espshowdist", "Show player distance")
    fn9(var234, "espuseteamcolors", "Use team colors")
    fn9(var234, "guards", "Show Guards", tbl2.esptargets)
    fn9(var234, "inmates", "Show Inmates", tbl2.esptargets)
    fn9(var234, "criminals", "Show Criminals", tbl2.esptargets)
    fn10(var234, "espmaxdist", "Player ESP max distance (studs)", 0, 2000, 25)
    fn16(var234, "esptoggle", "ESP hotkey")
    fn14(var234, "espcolor", "Default ESP color")
    fn14(var234, "espguards", "Guards color")
    fn14(var234, "espinmates", "Inmates color")
    fn14(var234, "espcriminals", "Criminals color")
    fn14(var234, "espteam", "Teammate color")
    local var235 = var198:AddSection("C4 ESP", nil)
    fn9(var235, "c4esp", "C4 ESP")
    fn9(var235, "c4espshowdist", "Show C4 distance")
    fn10(var235, "c4espmaxdist", "C4 ESP max distance (studs)", 0, 1000, 10)
    fn16(var235, "c4esptoggle", "C4 ESP hotkey")
    fn14(var235, "c4espcolor", "C4 ESP color")
    local var237
    local var238 = pcall(function()
        var237 = var199:AddSection("Configuration", true)
        var237:AddConfig()
    end)
    if not var238 and var237 then
        fn8(var237, "Configuration", "This BOLONG UI build does not expose AddConfig().")
    elseif not var238 then
        pcall(function()
            local var240 = var199:AddSection("Configuration", true)
            fn8(var240, "Configuration", "This BOLONG UI build does not expose AddConfig().")
        end)
    end
end
fn25()
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true
raycastParams.RespectCanCollide = false
raycastParams.CollisionGroup = "ClientBullet"
local raycastParams2 = RaycastParams.new()
raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
raycastParams2.IgnoreWater = true
raycastParams2.RespectCanCollide = false
raycastParams2.CollisionGroup = "ClientBullet"
local var242 = nil
local random = Random.new()
local num5 = 0
local flag13 = false
local var246 = nil
local num6 = 0
local num7 = 0
local tbl6 = {}
local var248 = tonumber(tbl2.aimmaxdist) or 0
local flag14 = false
local num8 = 0
local var250 = nil
local num9 = 0
local var251 = nil
local playerSettings = ReplicatedStorage:FindFirstChild("PlayerSettings")
local num10 = 0
local var252 = nil
local var253 = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("GiverPressed")
local tbl7 = {}
local tbl8 = {}
local num11 = 0
do
    local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
    local var254 = sharedModules and sharedModules:FindFirstChild("isInsideDynThumbFrame")
    if var254 then
        local var255, var256 = pcall(require, var254)
        if var255 and typeof(var256) == "function" then
            var252 = var256
        end
    end
end
local circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255, 112, 24)
circle.Radius = tbl2.fov
circle.Transparency = 0.8
circle.Filled = false
circle.NumSides = 64
circle.Thickness = 1
circle.Visible = tbl2.showfov and tbl2.enabled
local line = Drawing.new("Line")
line.Color = Color3.fromRGB(255, 145, 40)
line.Thickness = 1
line.Transparency = 0.5
line.Visible = false
local tbl9 = {container = nil}
local tbl10 = {}
local tbl11 = {}
local tbl12 = {}
local function fn26()
    num5 = 0
    flag13 = false
    var246 = nil
    num6 = 0
    num7 = 0
    num8 = 0
    var251 = nil
    num9 = 0
    var250 = nil
end
local function fn27()
    local playerGui = localPlayer:FindFirstChild("PlayerGui")
    local var261 = playerGui and playerGui:FindFirstChild("Home")
    return var261 and var261:FindFirstChild("hud") or nil
end
local function fn28()
    local var262 = fn27()
    return var262 and var262:FindFirstChild("MobileGunFrame") or nil
end
local function fn29()
    local var263 = fn28()
    return var263 and var263:FindFirstChild("MobileCursor") or nil
end
local function fn30()
    if not playerSettings then
        num10 = 0
        return
    end
    local var266 = playerSettings:GetAttribute("MobileCursorOffset")
    if typeof(var266) == "number" then
        num10 = var266 * 15
    else
        num10 = 0
    end
end
if playerSettings then
    fn30()
    playerSettings:GetAttributeChangedSignal("MobileCursorOffset"):Connect(fn30)
end
local function fn31(position)
    if var252 and var252(position.X, position.Y) then
        return true
    end
    local var269 = fn28()
    local var270 = var269 and var269:FindFirstChild("IgnoreTouchArea")
    if not var270 then
        return false
    end
    local X = position.X
    local Y = position.Y
    local X2 = var270.AbsolutePosition.X
    local var271 = X2 + var270.AbsoluteSize.X
    local Y2 = var270.AbsolutePosition.Y
    local var272 = Y2 + var270.AbsoluteSize.Y
    return X2 <= X and X <= var271 and Y2 <= Y and Y <= var272
end
local function fn32(arg6)
    arg6 = arg6 or workspace.CurrentCamera
    if not arg6 then
        return UserInputService:GetMouseLocation()
    end
    local var273 = UserInputService:GetLastInputType()
    if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local viewportSize = arg6.ViewportSize
        return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    end
    if var273 == Enum.UserInputType.Touch then
        local var274 = fn29()
        if var274 and var274.Visible then
            local absolutePosition = var274.AbsolutePosition
            local absoluteSize = var274.AbsoluteSize
            return Vector2.new(absolutePosition.X + absoluteSize.X / 2, absolutePosition.Y + absoluteSize.Y / 2)
        end
        local viewportSize2 = arg6.ViewportSize
        return Vector2.new(viewportSize2.X / 2, viewportSize2.Y / 2)
    end
    return UserInputService:GetMouseLocation()
end
local function fn33(arg7)
    arg7 = arg7 or workspace.CurrentCamera
    if not arg7 then
        return Vector2.zero
    end
    local viewportSize3 = arg7.ViewportSize
    return Vector2.new(viewportSize3.X / 2, viewportSize3.Y / 2)
end
local function fn34(arg8)
    if tbl2.staticfov then
        return fn33(arg8)
    end
    return fn32(arg8)
end
local function fn35(arg9)
    return arg9 and arg9:GetAttribute("Behavior") == "Sniper"
end
local function fn36(arg10)
    if not arg10 then
        return false
    end
    local var275 = string.lower(tostring(arg10:GetAttribute("Behavior") or ""))
    local var276 = string.lower(tostring(arg10:GetAttribute("Projectile") or ""))
    local name = string.lower(tostring(arg10.Name or ""))
    return var275 == "taser" or var275 == "tazer" or var276 == "taser" or var276 == "tazer" or name:find("taser", 1, true) ~= nil or name:find("tazer", 1, true) ~= nil
end
local function fn37(arg11)
    return arg11 and (arg11:GetAttribute("IsShotgun") or arg11:GetAttribute("Behavior") == "Shotgun")
end
local function fn38(arg12)
    return arg12 and arg12:GetAttribute("AutoFire") == true
end
local function fn39(value)
    return tostring(value or ""):lower():gsub("%s+", "")
end
local function fn40(arg13)
    if not arg13 then
        return false
    end
    local var279 = fn39(tbl2.autoshootweapon)
    if var279 == "" or var279 == "any" or var279 == "all" then
        return true
    end
    local var280 = fn39(arg13.Name)
    local var281 = fn39(arg13:GetAttribute("Behavior"))
    local var283 = fn39(arg13:GetAttribute("Projectile"))
    if var279 == "taser" then
        return fn36(arg13) or var280:find("taser", 1, true) ~= nil
    elseif var279 == "shotgun" then
        return fn37(arg13)
    elseif var279 == "sniper" then
        return fn35(arg13)
    elseif var279 == "auto" or var279 == "automatic" then
        return fn38(arg13)
    end
    return var279 == var280 or var279 == var281 or var279 == var283
end
local function fn41()
    local character = localPlayer.Character
    if not character then
        return nil
    end
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
end
local function fn42(targetPos)
    local var286 = tonumber(tbl2.aimmaxdist) or 0
    if var286 <= 0 or not targetPos then
        return true
    end
    local var287 = fn41()
    if not var287 then
        return true
    end
    return (targetPos - var287.Position).Magnitude <= var286
end
local function fn43()
    local var288 = tonumber(tbl2.aimmaxdist) or 0
    if tbl2.distancebasedhitchance then
        if var288 > 0 then
            var248 = var288
        elseif var248 <= 0 then
            var248 = 100
        end
        tbl2.aimmaxdist = 0
        flag14 = true
    elseif flag14 then
        tbl2.aimmaxdist = tonumber(var248) or 0
        flag14 = false
    else
        var248 = var288
    end
end
local function fn44(arg14)
    return arg14 ~= nil and tbl2.hitchanceAutoOnly and not fn38(arg14)
end
local function fn45()
    local character = localPlayer.Character
    return character and character:FindFirstChildOfClass("Humanoid") or nil
end
local function fn46(arg15)
    if not fn35(arg15) then
        return true
    end
    if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
        return false
    end
    local var294 = fn45()
    return not var294 or var294:GetState() ~= Enum.HumanoidStateType.Freefall
end
local function fn47()
    local character2 = localPlayer.Character
    local var295 = character2 and character2:FindFirstChild("Head")
    if not var295 then
        return nil
    end
    local var296 = var242 and var242:FindFirstChild("Muzzle")
    return var296 and var296.Position or var295.Position
end
local function fn48(targetPos, originPos)
    if not var242 or not targetPos then
        return true
    end
    local var297 = var242:GetAttribute("Range")
    if typeof(var297) ~= "number" or var297 <= 0 then
        return true
    end
    originPos = originPos or fn47()
    if not originPos then
        return true
    end
    return (targetPos - originPos).Magnitude <= var297 + 5
end
local function fn49(obj)
    if not obj or not obj:IsA("Model") then
        return false
    end
    local name = obj.Name:lower()
    return name:find("keycard", 1, true) ~= nil or name == "m9"
end
local function fn50(obj)
    if not tbl2.autograb or not obj or not obj:IsA("Model") then
        return false
    end
    local name = obj.Name:lower()
    if name:find("keycard", 1, true) ~= nil then
        return tbl2.autograbkeycard
    end
    if name == "m9" then
        return tbl2.autograbm9
    end
    return false
end
local function fn51(obj)
    local var300 = obj and obj.Parent
    while var300 and var300 ~= workspace do
        if var300:FindFirstChildOfClass("Humanoid") then
            return true
        end
        if var300.Name == "Backpack" then
            return true
        end
        var300 = var300.Parent
    end
    return false
end
local function fn52(model)
    if not model then
        return nil
    end
    return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
end
local function fn53(a, b)
    local var302 = a - b
    return var302.X * var302.X + var302.Y * var302.Y + var302.Z * var302.Z
end
local function onDescendantAdded(obj)
    if fn49(obj) then
        tbl7[obj] = true
    end
end
local function onDescendantRemoving(obj)
    tbl7[obj] = nil
    tbl8[obj] = nil
end
local function fn54(arg16)
    if not tbl2.autograb or not var253 then
        return
    end
    if arg16 - num11 < 0.05 then
        return
    end
    local var304 = fn41()
    if not var304 then
        return
    end
    local var305 = math.clamp(tonumber(tbl2.autograbdistance) or 0, 0, 12)
    if var305 <= 0 then
        return
    end
    local var306 = math.max(tonumber(tbl2.autograbdelay) or 0, 0)
    local var307 = var305 * var305
    for k in pairs(tbl7) do
        if not k or not k.Parent then
            onDescendantRemoving(k)
        elseif not fn50(k) then
            tbl8[k] = nil
        elseif fn51(k) then
            tbl8[k] = nil
        else
            local part = fn52(k)
            if part and fn53(var304.Position, part.Position) <= var307 then
                if not tbl8[k] then
                    tbl8[k] = arg16
                elseif arg16 - tbl8[k] >= var306 then
                    num11 = arg16
                    tbl8[k] = nil
                    pcall(var253.FireServer, var253, k)
                    return
                end
            else
                tbl8[k] = nil
            end
        end
    end
end
local function fn55(arg17)
    if not arg17 then
        return false
    end
    local var310 = UserInputService:GetLastInputType()
    return var310 == Enum.UserInputType.Touch or var310 == Enum.UserInputType.Gamepad1 or fn37(arg17)
end
local function fn56(arg18, arg19, arg20)
    if not arg20 or not arg18 or not arg19 then
        return nil, arg19
    end
    local var311 = arg20:GetAttribute("Behavior")
    local var312 = arg20:GetAttribute("SpreadRadius") or 0
    local var313 = arg20:GetAttribute("Range") or 1500
    local var315 = random:NextNumber()
    if var311 == "Sniper" or var311 == "Shotgun" then
        var315 = math.sqrt(var315)
    end
    local cFrame2 = CFrame.new(arg18, arg19)
    local var316 = math.rad(360 - 720 * random:NextNumber())
    local var319 = (cFrame2 * CFrame.Angles(0, 0, var316) * CFrame.Angles(0, var315 * var312, 0)).LookVector * var313
    raycastParams2.FilterDescendantsInstances = {localPlayer.Character}
    local var320 = workspace:Raycast(arg18, var319, raycastParams2)
    if var320 then
        return var320.Instance, var320.Position
    end
    return nil, arg18 + var319
end
local function fn57()
    local container
    local var321 = gethui and gethui() or CoreGui
    local var322 = var321:FindFirstChild("SilentAimESP") or CoreGui:FindFirstChild("SilentAimESP")
    if var322 then
        var322:Destroy()
    end
    if gethui then
        local screenGui3 = Instance.new("ScreenGui")
        screenGui3.Name = "SilentAimESP"
        screenGui3.ResetOnSpawn = false
        screenGui3.Parent = gethui()
        container = screenGui3
    elseif syn and syn.protect_gui then
        local screenGui4 = Instance.new("ScreenGui")
        screenGui4.Name = "SilentAimESP"
        screenGui4.ResetOnSpawn = false
        syn.protect_gui(screenGui4)
        screenGui4.Parent = CoreGui
        container = screenGui4
    else
        local screenGui5 = Instance.new("ScreenGui")
        screenGui5.Name = "SilentAimESP"
        screenGui5.ResetOnSpawn = false
        screenGui5.Parent = CoreGui
        container = screenGui5
    end
    tbl9.container = container
end
local function fn58(player)
    if tbl10[player] then
        return tbl10[player]
    end
    local esp = Instance.new("BillboardGui")
    esp.Name = "ESP_" .. player.Name
    esp.AlwaysOnTop = true
    esp.Size = UDim2.new(0, 20, 0, 20)
    esp.StudsOffset = Vector3.new(0, 3, 0)
    esp.LightInfluence = 0
    local frame = Instance.new("Frame")
    frame.Name = "Diamond"
    frame.BackgroundColor3 = tbl2.espcolor
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(0, 10, 0, 10)
    frame.Position = UDim2.new(0.5, -5, 0.5, -5)
    frame.Rotation = 45
    frame.Parent = esp
    local uIStroke3 = Instance.new("UIStroke")
    uIStroke3.Color = Color3.new(0, 0, 0)
    uIStroke3.Thickness = 1.5
    uIStroke3.Transparency = 0.3
    uIStroke3.Parent = frame
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "DistanceLabel"
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(0, 60, 0, 16)
    textLabel.Position = UDim2.new(0.5, -30, 1, 2)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 11
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.Text = ""
    textLabel.Parent = esp
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Name = "NameLabel"
    textLabel2.BackgroundTransparency = 1
    textLabel2.Size = UDim2.new(0, 100, 0, 14)
    textLabel2.Position = UDim2.new(0.5, -50, 0, -16)
    textLabel2.Font = Enum.Font.GothamBold
    textLabel2.TextSize = 10
    textLabel2.TextColor3 = Color3.new(1, 1, 1)
    textLabel2.TextStrokeTransparency = 0.5
    textLabel2.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel2.Text = player.Name
    textLabel2.Parent = esp
    tbl10[player] = esp
    return esp
end
local function onPlayerRemoving(player)
    local var344 = tbl10[player]
    if var344 then
        var344:Destroy()
        tbl10[player] = nil
    end
    local var345 = tbl11[player]
    if var345 then
        pcall(function()
            var345:Destroy()
        end)
        tbl11[player] = nil
    end
    tbl12[player] = nil
    if player and player.Character then
        tbl6[player.Character] = nil
    end
    if var246 == player then
        var246 = nil
    end
    if var251 == player then
        var251 = nil
    end
end
local function fn59(player)
    if not player or player == localPlayer or not player.Character then
        return false
    end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        return false
    end
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        return false
    end
    local character3 = localPlayer.Character
    if not character3 then
        return false
    end
    local humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart2 then
        return false
    end
    local distance = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude
    local var348 = tonumber(tbl2.espmaxdist) or 0
    if var348 > 0 and distance > var348 then
        return false
    end
    local team = localPlayer.Team
    local team2 = player.Team
    if team2 == team then
        if not tbl2.espshowteam then
            return false
        end
        return true
    end
    if tbl2.espteamcheck then
        local var351 = team == criminals or team == inmates
        local var352 = team2 == criminals or team2 == inmates
        if var351 and var352 then
            return false
        end
    end
    if team2 == guards then
        return tbl2.esptargets.guards
    elseif team2 == inmates then
        return tbl2.esptargets.inmates
    elseif team2 == criminals then
        return tbl2.esptargets.criminals
    end
    return false
end
local function fn60(player)
    local var353 = player and player.Team
    if not var353 then
        return nil
    end
    local var354 = string.lower(var353.Name or "")
    if var353 == criminals or var354:find("criminal", 1, true) then
        return Color3.fromRGB(255, 60, 60)
    elseif var353 == inmates or var354:find("inmate", 1, true) then
        return Color3.fromRGB(255, 150, 50)
    elseif var353 == guards or var354:find("guard", 1, true) or var354:find("police", 1, true) then
        return Color3.fromRGB(0, 120, 255)
    end
    return nil
end
local function fn61(player)
    if not player or player == localPlayer then
        return false
    end
    if not player.Character then
        return false
    end
    if not fn60(player) then
        return false
    end
    local humanoid2 = player.Character:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart3 = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart3 then
        return false
    end
    local character4 = localPlayer.Character
    local var356 = character4 and character4:FindFirstChild("HumanoidRootPart")
    if not var356 then
        return false
    end
    local var357 = tonumber(tbl2.espmaxdist) or 0
    if var357 > 0 and (humanoidRootPart3.Position - var356.Position).Magnitude > var357 then
        return false
    end
    return true
end
local function fn62()
    for _, player in ipairs(Players:GetPlayers()) do
        local var358 = tbl2.outlineesp and fn61(player)
        local character = var358 and player.Character or nil
        local var359 = tbl11[player]
        if var358 and character then
            if not var359 then
                var359 = Instance.new("Highlight")
                var359.Name = "OutlineESP_" .. player.Name
                tbl11[player] = var359
            end
            local var360 = fn60(player)
            var359.Adornee = character
            var359.FillColor = var360
            var359.OutlineColor = var360
            var359.FillTransparency = 0.66
            var359.OutlineTransparency = 0
            var359.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            var359.Enabled = true
            var359.Parent = Workspace
        elseif var359 then
            var359.Enabled = false
        end
    end
end
local function fn63()
    if not tbl2.esp or not tbl9.container then
        for _, v3 in pairs(tbl10) do
            v3.Parent = nil
        end
    else
        local character5 = localPlayer.Character
        local var362 = character5 and character5:FindFirstChild("HumanoidRootPart")
        for _, player in ipairs(Players:GetPlayers()) do
            local var363 = fn59(player)
            if var363 then
                local character6 = player.Character
                local var364 = character6 and character6:FindFirstChild("HumanoidRootPart")
                local var366 = character6 and character6:FindFirstChild("Head")
                if var364 and var366 then
                    local esp = fn58(player)
                    esp.Adornee = var366
                    esp.Parent = tbl9.container
                    local diamond = esp:FindFirstChild("Diamond")
                    if diamond and tbl2.espuseteamcolors then
                        local team3 = player.Team
                        if team3 == localPlayer.Team then
                            diamond.BackgroundColor3 = tbl2.espteam
                        elseif team3 == guards then
                            diamond.BackgroundColor3 = tbl2.espguards
                        elseif team3 == inmates then
                            diamond.BackgroundColor3 = tbl2.espinmates
                        elseif team3 == criminals then
                            diamond.BackgroundColor3 = tbl2.espcriminals
                        else
                            diamond.BackgroundColor3 = tbl2.espcolor
                        end
                    end
                    local distanceLabel = esp:FindFirstChild("DistanceLabel")
                    if distanceLabel then
                        if tbl2.espshowdist and var362 then
                            distanceLabel.Text = math.floor((var364.Position - var362.Position).Magnitude) .. "m"
                            distanceLabel.Visible = true
                        else
                            distanceLabel.Visible = false
                        end
                    end
                end
            else
                local var373 = tbl10[player]
                if var373 then
                    var373.Parent = nil
                end
            end
        end
    end
    fn62()
end
local tbl13 = {}
local function fn64(c4Part)
    if tbl13[c4Part] then
        return tbl13[c4Part]
    end
    local esp = Instance.new("BillboardGui")
    esp.Name = "C4ESP_" .. tostring(c4Part)
    esp.AlwaysOnTop = true
    esp.Size = UDim2.new(0, 24, 0, 24)
    esp.StudsOffset = Vector3.new(0, 1, 0)
    esp.LightInfluence = 0
    local frame2 = Instance.new("Frame")
    frame2.Name = "Icon"
    frame2.BackgroundColor3 = tbl2.c4espcolor
    frame2.BorderSizePixel = 0
    frame2.Size = UDim2.new(0, 14, 0, 14)
    frame2.Position = UDim2.new(0.5, -7, 0.5, -7)
    frame2.Rotation = 45
    frame2.Parent = esp
    local uIStroke4 = Instance.new("UIStroke")
    uIStroke4.Color = Color3.new(0, 0, 0)
    uIStroke4.Thickness = 2
    uIStroke4.Transparency = 0.2
    uIStroke4.Parent = frame2
    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Name = "Label"
    textLabel3.BackgroundTransparency = 1
    textLabel3.Size = UDim2.new(0, 60, 0, 14)
    textLabel3.Position = UDim2.new(0.5, -30, 1, 2)
    textLabel3.Font = Enum.Font.GothamBold
    textLabel3.TextSize = 11
    textLabel3.TextColor3 = Color3.new(1, 1, 1)
    textLabel3.TextStrokeTransparency = 0.5
    textLabel3.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel3.Text = "C4"
    textLabel3.Parent = esp
    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Name = "DistLabel"
    textLabel4.BackgroundTransparency = 1
    textLabel4.Size = UDim2.new(0, 60, 0, 12)
    textLabel4.Position = UDim2.new(0.5, -30, 1, 16)
    textLabel4.Font = Enum.Font.GothamBold
    textLabel4.TextSize = 10
    textLabel4.TextColor3 = tbl2.c4espcolor
    textLabel4.TextStrokeTransparency = 0.5
    textLabel4.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel4.Text = ""
    textLabel4.Parent = esp
    tbl13[c4Part] = esp
    return esp
end
local tbl14 = {}
local function fn65(part)
    if not part or not part:IsA("BasePart") then
        return false
    end
    local name = part.Name:lower()
    local var381 = part.Parent and part.Parent.Name:lower() or ""
    return name == "explosive" or name == "c4" or name == "clientc4" or var381:find("c4") or name:find("c4")
end
local function onDescendantAdded2(arg21)
    if fn65(arg21) then
        tbl14[arg21] = true
    end
end
local function onDescendantRemoving2(arg22)
    tbl14[arg22] = nil
    if tbl13[arg22] then
        tbl13[arg22].Destroy(tbl13[arg22])
        tbl13[arg22] = nil
    end
end
for _, v4 in ipairs(workspace:GetDescendants()) do
    if fn65(v4) then
        tbl14[v4] = true
    end
    onDescendantAdded(v4)
end
workspace.DescendantAdded:Connect(onDescendantAdded2)
workspace.DescendantRemoving:Connect(onDescendantRemoving2)
workspace.DescendantAdded:Connect(onDescendantAdded)
workspace.DescendantRemoving:Connect(onDescendantRemoving)
local function fn66()
    if not tbl2.c4esp or not tbl9.container then
        for _, v5 in pairs(tbl13) do
            v5.Parent = nil
        end
        return
    end
    local character7 = localPlayer.Character
    local var385 = character7 and character7:FindFirstChild("HumanoidRootPart")
    for part in pairs(tbl14) do
        if part and part:IsDescendantOf(workspace) then
            local dist = 0
            if var385 then
                dist = (part.Position - var385.Position).Magnitude
            end
            local var386 = tonumber(tbl2.c4espmaxdist) or 0
            if var386 <= 0 or dist <= var386 then
                local esp = fn64(part)
                esp.Adornee = part
                esp.Parent = tbl9.container
                if tbl2.c4espshowdist and var385 then
                    local distLabel = esp:FindFirstChild("DistLabel")
                    if distLabel then
                        distLabel.Text = math.floor(dist) .. "m"
                    end
                else
                    local distLabel2 = esp:FindFirstChild("DistLabel")
                    if distLabel2 then
                        distLabel2.Text = ""
                    end
                end
            else
                local var388 = tbl13[part]
                if var388 then
                    var388.Parent = nil
                end
            end
        else
            tbl14[part] = nil
            if tbl13[part] then
                tbl13[part].Destroy(tbl13[part])
                tbl13[part] = nil
            end
        end
    end
end
fn57()
local tbl15 = {
    Torso = {"Torso"},
    LeftArm = {"Left Arm"},
    RightArm = {"Right Arm"},
    LeftLeg = {"Left Leg"},
    RightLeg = {"Right Leg"},
}
local function fn67(name)
    return tostring(name or ""):gsub("%s+", "")
end
local function fn68(character8, name)
    if not character8 then
        return nil
    end
    local var390 = character8:FindFirstChild(name)
    if var390 then
        return var390
    end
    local var391 = tbl15[fn67(name)]
    if var391 then
        for _, v6 in ipairs(var391) do
            local part = character8:FindFirstChild(v6)
            if part then
                return part
            end
        end
    end
    return character8:FindFirstChild("HumanoidRootPart") or character8:FindFirstChild("Head")
end
local function fn69(character9)
    if not character9 then
        return nil
    end
    return character9:FindFirstChild("Torso") or character9:FindFirstChild("HumanoidRootPart") or character9:FindFirstChild("Head")
end
local function fn70(character10)
    if not character10 then
        return nil
    end
    if fn36(var242) then
        return fn69(character10)
    end
    if tbl2.shieldbreaker then
        local riotShieldPart = character10:FindFirstChild("RiotShieldPart")
        if riotShieldPart and riotShieldPart:IsA("BasePart") then
            local var393 = riotShieldPart:GetAttribute("Health")
            if var393 and var393 > 0 then
                local character11 = localPlayer.Character
                local var394 = character11 and character11:FindFirstChild("HumanoidRootPart")
                local humanoidRootPart4 = character10:FindFirstChild("HumanoidRootPart")
                if var394 and humanoidRootPart4 then
                    local unit = (var394.Position - humanoidRootPart4.Position).Unit
                    local lookVector = humanoidRootPart4.CFrame.LookVector
                    local var396 = unit:Dot(lookVector)
                    if var396 > tbl2.shieldfrontangle then
                        if tbl2.shieldrandomhead and random:NextInteger(1, 100) <= tbl2.shieldheadchance then
                            return fn68(character10, "Head")
                        end
                        return riotShieldPart
                    end
                end
            end
        end
    end
    local partName
    if tbl2.randomparts then
        local var399 = tbl6[character10]
        if var399 and var399.part and var399.part.Parent == character10 and var399.expiresAt > os.clock() then
            return var399.part
        end
        local partslist = tbl2.partslist
        partName = partslist and #partslist > 0 and partslist[random:NextInteger(1, #partslist)] or "Head"
    else
        partName = tbl2.aimpart
    end
    local part = fn68(character10, partName)
    if tbl2.randomparts and part then
        tbl6[character10] = {part = part, partName = partName, expiresAt = os.clock() + 0.15}
    end
    return part
end
local function fn71(player)
    if not player or not player.Character then
        return true
    end
    local humanoid3 = player.Character:FindFirstChildOfClass("Humanoid")
    return not humanoid3 or humanoid3.Health <= 0
end
local function fn72(player)
    if not player or not player.Character then
        return false
    end
    local humanoidRootPart5 = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart5 then
        return false
    end
    local assemblyLinearVelocity = humanoidRootPart5.AssemblyLinearVelocity
    return Vector2.new(assemblyLinearVelocity.X, assemblyLinearVelocity.Z).Magnitude <= tbl2.stillthreshold
end
local function fn73(player)
    if not player or not player.Character then
        return false
    end
    return player.Character:FindFirstChildOfClass("ForceField") ~= nil
end
local function fn74(player)
    if not player or not player.Character then
        return false
    end
    local humanoid4 = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid4 then
        return false
    end
    return humanoid4.SeatPart ~= nil
end
local function fn75(arg23, endPos, arg24)
    local character12 = localPlayer.Character
    if not character12 then
        return true
    end
    local tbl16 = {character12}
    if arg24 then
        table.insert(tbl16, arg24)
    end
    raycastParams.FilterDescendantsInstances = tbl16
    local var402 = endPos - arg23
    local distance = var402.Magnitude
    if distance <= 0.001 then
        return false
    end
    local unit2 = var402.Unit
    local var403 = arg23
    local var404 = distance
    for i = 1, 10 do
        local var405 = workspace:Raycast(var403, unit2 * var404, raycastParams)
        if not var405 then
            return false
        end
        local instance = var405.Instance
        if instance.Transparency < 0.8 and instance.CanCollide then
            return true
        end
        local magnitude = (var405.Position - var403).Magnitude
        var404 = var404 - magnitude - 0.01
        if var404 <= 0 then
            return false
        end
        var403 = var405.Position + unit2 * 0.01
    end
    return false
end
local function fn76(player)
    if not player then
        return ""
    end
    local var409 = os.clock()
    local character = player.Character
    local var410 = tbl12[player]
    if var410 and var410.character == character and var409 - var410.updated < 0.35 then
        return var410.text
    end
    local tbl17 = {tostring(player.Name or ""), tostring(player.DisplayName or "")}
    if character then
        for _, v7 in ipairs(character:GetDescendants()) do
            if v7:IsA("TextLabel") or v7:IsA("TextButton") or v7:IsA("TextBox") then
                local text2 = v7.Text
                if type(text2) == "string" and text2 ~= "" then
                    tbl17[#tbl17 + 1] = text2
                end
            end
        end
        local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui")
        if playerGui2 then
            for _, v8 in ipairs(playerGui2:GetDescendants()) do
                if v8:IsA("BillboardGui") then
                    local adornee = v8.Adornee
                    local var415 = adornee and adornee:IsDescendantOf(character)
                    if var415 then
                        for _, v9 in ipairs(v8:GetDescendants()) do
                            if v9:IsA("TextLabel") or v9:IsA("TextButton") or v9:IsA("TextBox") then
                                local text3 = v9.Text
                                if type(text3) == "string" and text3 ~= "" then
                                    tbl17[#tbl17 + 1] = text3
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local var417 = table.concat(tbl17, " ")
    tbl12[player] = {character = character, updated = var409, text = var417}
    return var417
end
local function fn77(value)
    return tostring(value or ""):gsub("â", ""):gsub("ï¸", "")
end
local function fn78(player, emoji)
    local var420 = fn77(fn76(player))
    local var421 = fn77(emoji)
    return string.find(var420, var421, 1, true) ~= nil
end
local function fn79(player, gunOverride)
    if not player then
        return true
    end
    local var422 = gunOverride or var242
    if fn36(var422) then
        return true
    end
    if tbl2.ignoreviolenceemoji and fn78(player, "💢") then
        return false
    end
    if tbl2.ignorechainemoji and fn78(player, "⛓️‍💥") then
        return false
    end
    return true
end
local var423
local function fn80(player, ignoreDistanceLimits)
    if not player or player == localPlayer or not player.Character then
        return false
    end
    local targetPart = fn70(player.Character)
    if not targetPart then
        return false
    end
    if not ignoreDistanceLimits and not fn42(targetPart.Position) then
        return false
    end
    if not ignoreDistanceLimits and not fn48(targetPart.Position) then
        return false
    end
    if tbl2.deathcheck and fn71(player) then
        return false
    end
    if tbl2.ffcheck and fn73(player) then
        return false
    end
    if tbl2.vehiclecheck and fn74(player) then
        return false
    end
    if tbl2.teamcheck and player.Team == localPlayer.Team then
        return false
    end
    if not fn79(player) then
        return false
    end
    if tbl2.criminalsnoinnmates then
        if localPlayer.Team == criminals and player.Team == inmates then
            return false
        end
    end
    if tbl2.inmatesnocriminals then
        if localPlayer.Team == inmates and player.Team == criminals then
            return false
        end
    end
    if tbl2.hostilecheck or tbl2.trespasscheck then
        local var424 = fn36(var242)
        local var425 = tbl2.taserbypasshostile and var424
        local var426 = tbl2.taserbypasstrespass and var424
        local character13 = player.Character
        if localPlayer.Team == guards and player.Team == inmates then
            local var427 = character13:GetAttribute("Hostile")
            local var428 = character13:GetAttribute("Trespassing")
            if tbl2.hostilecheck and tbl2.trespasscheck then
                if not var425 and not var426 then
                    if not var427 and not var428 then
                        return false
                    end
                end
            elseif tbl2.hostilecheck and not var425 then
                if not var427 then
                    return false
                end
            elseif tbl2.trespasscheck and not var426 then
                if not var428 then
                    return false
                end
            end
        end
    end
    return true
end
var423 = function(player, ignoreDistanceLimits)
    if not fn80(player, ignoreDistanceLimits) then
        return false
    end
    if not tbl2.wallcheck then
        return true
    end
    local character = player and player.Character
    local targetPart = character and fn70(character)
    if not targetPart then
        return false
    end
    local var431 = fn47()
    if not var431 then
        local var432 = fn41()
        var431 = var432 and var432.Position or nil
    end
    if var431 and fn75(var431, targetPart.Position, character) then
        return false
    end
    return true
end
local function fn81(chanceOverride)
    num5 = os.clock()
    local chance = math.clamp(tonumber(chanceOverride) or tonumber(tbl2.hitchance) or 0, 0, 100)
    if chance >= 100 then
        flag13 = true
    elseif chance <= 0 then
        flag13 = false
    else
        flag13 = random:NextInteger(1, 100) <= chance
    end
    return flag13
end
local function fn82(targetPart, originPos)
    local var435 = math.clamp(tonumber(tbl2.hitchance) or 0, 0, 100)
    if not tbl2.distancebasedhitchance then
        return var435
    end
    if not targetPart then
        return var435
    end
    local var436 = originPos or fn47()
    if not var436 then
        local var439 = fn41()
        var436 = var439 and var439.Position or nil
    end
    if not var436 then
        return var435
    end
    local distance = (targetPart.Position - var436).Magnitude
    local var440 = var435
    local tbl18 = {
        {
            distance = math.max(tonumber(tbl2.distancehitchance1dist) or 0, 0),
            chance = math.clamp(tonumber(tbl2.distancehitchance1value) or var435, 0, 100),
        },
        {
            distance = math.max(tonumber(tbl2.distancehitchance2dist) or 0, 0),
            chance = math.clamp(tonumber(tbl2.distancehitchance2value) or var435, 0, 100),
        },
        {
            distance = math.max(tonumber(tbl2.distancehitchance3dist) or 0, 0),
            chance = math.clamp(tonumber(tbl2.distancehitchance3value) or var435, 0, 100),
        },
        {
            distance = math.max(tonumber(tbl2.distancehitchance4dist) or 0, 0),
            chance = math.clamp(tonumber(tbl2.distancehitchance4value) or var435, 0, 100),
        },
        {
            distance = math.max(tonumber(tbl2.distancehitchance5dist) or 0, 0),
            chance = math.clamp(tonumber(tbl2.distancehitchance5value) or var435, 0, 100),
        },
    }
    table.sort(tbl18, function(a, b)
        return a.distance < b.distance
    end)
    for _, v10 in ipairs(tbl18) do
        if v10.distance > 0 and distance >= v10.distance then
            var440 = v10.chance
        end
    end
    return var440
end
local function fn83(arg25, targetPartOrPos)
    local targetPart = typeof(targetPartOrPos) == "Instance" and targetPartOrPos:IsA("BasePart") and targetPartOrPos or nil
    local targetPos = targetPart and targetPart.Position or targetPartOrPos
    if not targetPos then
        return arg25
    end
    local var443 = targetPos - arg25
    if var443.Magnitude <= 0.001 then
        return targetPos + Vector3.new(tbl2.missspread + 6, 0, 0)
    end
    local unit3 = var443.Unit
    local var444 = math.abs(unit3.Y) > 0.98 and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)
    local var445 = unit3:Cross(var444)
    if var445.Magnitude <= 0.001 then
        var445 = Vector3.new(0, 0, 1)
    else
        var445 = var445.Unit
    end
    local var446 = var445:Cross(unit3)
    if var446.Magnitude <= 0.001 then
        var446 = Vector3.new(0, 1, 0)
    else
        var446 = var446.Unit
    end
    local var448 = targetPart and math.max(targetPart.Size.X, targetPart.Size.Y, targetPart.Size.Z) * 0.75 or 2
    local var449 = math.max(tbl2.missspread, var448 + 3)
    local var450 = random:NextNumber(0, math.pi * 2)
    local var451 = var445 * math.cos(var450) * var449 + var446 * math.sin(var450) * var449
    return targetPos + var451
end
local function fn84(player)
    if not tbl2.prioritizecriminals then
        return 0
    end
    if player.Team == criminals then
        return 0
    end
    if player.Team == inmates then
        return 1
    end
    return 0
end
local function fn85(fovRadius, ignoreDistanceLimits)
    fovRadius = fovRadius or tbl2.fov
    local currentCamera3 = workspace.CurrentCamera
    if not currentCamera3 then
        return nil, nil
    end
    local var455 = fn34(currentCamera3)
    local var456 = os.clock()
    if tbl2.targetstickiness and var246 and var456 - num6 < num7 then
        if var423(var246, ignoreDistanceLimits) then
            local part = fn70(var246.Character)
            if part then
                local var457, onScreen = currentCamera3:WorldToViewportPoint(part.Position)
                if onScreen and var457.Z > 0 then
                    local dist = (Vector2.new(var457.X, var457.Y) - var455).Magnitude
                    if dist < fovRadius then
                        return var246, part.Position
                    end
                end
            end
        end
    end
    local tbl19 = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if fn80(player, ignoreDistanceLimits) then
            local part = fn70(player.Character)
            if part then
                local var462, onScreen = currentCamera3:WorldToViewportPoint(part.Position)
                if onScreen and var462.Z > 0 then
                    local dist = (Vector2.new(var462.X, var462.Y) - var455).Magnitude
                    if dist < fovRadius then
                        tbl19[#tbl19 + 1] = {player = player, dist = dist, part = part, priority = fn84(player)}
                    end
                end
            end
        end
    end
    if tbl2.prioritizeclosest then
        table.sort(tbl19, function(a, b)
            if a.priority ~= b.priority then
                return a.priority < b.priority
            end
            return a.dist < b.dist
        end)
    else
        local huge = math.huge
        for _, v11 in ipairs(tbl19) do
            if v11.priority < huge then
                huge = v11.priority
            end
        end
        if huge < math.huge then
            local tbl20 = {}
            for _, v12 in ipairs(tbl19) do
                if v12.priority == huge then
                    tbl20[#tbl20 + 1] = v12
                end
            end
            tbl19 = tbl20
        end
        for i2 = #tbl19, 2, -1 do
            local var468 = random:NextInteger(1, i2)
            tbl19[i2], tbl19[var468] = tbl19[var468], tbl19[i2]
        end
    end
    for _, v13 in ipairs(tbl19) do
        if var423(v13.player, ignoreDistanceLimits) then
            local part = fn70(v13.player.Character)
            if not part then
                continue
            end
            if v13.player ~= var246 then
                var246 = v13.player
                num6 = var456
                if tbl2.targetstickinessrandom then
                    num7 = random:NextNumber(tbl2.targetstickinessmin, tbl2.targetstickinessmax)
                else
                    num7 = tbl2.targetstickinessduration
                end
            end
            return v13.player, part.Position
        end
    end
    var246 = nil
    return nil, nil
end
local shootEvent = ReplicatedStorage:WaitForChild("GunRemotes"):WaitForChild("ShootEvent")
local funcReload = ReplicatedStorage:WaitForChild("GunRemotes"):WaitForChild("FuncReload")
local Debris = game:GetService("Debris")
local num12 = 0
local var470 = setmetatable({}, {__mode = "k"})
local function fn86(arg26, endPos, arg27)
    local distance = (endPos - arg26).Magnitude
    local part2 = Instance.new("Part")
    part2.Name = "BulletTrail"
    part2.Anchored = true
    part2.CanCollide = false
    part2.CanQuery = false
    part2.CanTouch = false
    part2.Material = Enum.Material.Neon
    part2.Size = Vector3.new(0.1, 0.1, distance)
    part2.CFrame = CFrame.new(arg26, endPos) * CFrame.new(0, 0, -distance / 2)
    part2.Transparency = 0.5
    if arg27 then
        part2.BrickColor = BrickColor.new("Cyan")
        part2.Size = Vector3.new(0.2, 0.2, distance)
        local surfaceLight = Instance.new("SurfaceLight")
        surfaceLight.Color = Color3.fromRGB(0, 234, 255)
        surfaceLight.Range = 7
        surfaceLight.Brightness = 5
        surfaceLight.Face = Enum.NormalId.Bottom
        surfaceLight.Parent = part2
    else
        part2.BrickColor = BrickColor.Yellow()
    end
    part2.Parent = workspace
    Debris:AddItem(part2, arg27 and 0.8 or 0.1)
end
local function fn87()
    if var250 and var250.Parent then
        return var250
    end
    var250 = nil
    local playerGui3 = localPlayer:FindFirstChild("PlayerGui")
    local var474 = playerGui3 and playerGui3:FindFirstChild("Home")
    local var475 = var474 and var474:FindFirstChild("hud")
    local var476 = var475 and var475:FindFirstChild("BottomRightFrame")
    local var477 = var476 and var476:FindFirstChild("GunFrame")
    var250 = var477 and var477:FindFirstChild("BulletsLabel") or nil
    return var250
end
local function fn88(arg28)
    if not arg28 then
        return nil, nil, nil
    end
    local var478 = tonumber(arg28:GetAttribute("Local_CurrentAmmo"))
    local var479 = tonumber(arg28:GetAttribute("CurrentAmmo"))
    if var479 ~= nil then
        local var481 = var470[arg28]
        if var481 ~= nil and var479 ~= var481 then
            var478 = var479
            pcall(function()
                arg28:SetAttribute("Local_CurrentAmmo", var479)
            end)
        end
        var470[arg28] = var479
    end
    local var482 = var478
    if var482 == nil then
        var482 = var479
    end
    local maxAmmo = tonumber(arg28:GetAttribute("MaxAmmo") or arg28:GetAttribute("AmmoPerClip"))
    local var485 = tonumber(arg28:GetAttribute("StoredAmmo"))
    return var482, maxAmmo, var485
end
local function fn89(arg29)
    local var486 = os.clock()
    if var486 - num12 < 0.5 then
        return false
    end
    if not arg29 or not arg29.Parent or (tonumber(arg29:GetAttribute("Local_ReloadSession")) or 0) ~= 0 then
        return false
    end
    num12 = var486
    task.spawn(function()
        local var487, err = pcall(function()
            funcReload:InvokeServer()
        end)
        if not var487 then
            warn("[Ammo] Reload request failed: " .. tostring(err))
        end
    end)
    return true
end
task.spawn(function()
    while true do
        task.wait(0.1)
        local var488 = var242
        local character = localPlayer.Character
        if tbl2.enabled and var488 and character and var488.Parent == character then
            local var489 = tonumber(var488:GetAttribute("Local_ReloadSession")) or 0
            if var489 == 0 then
                local var490, maxAmmo = fn88(var488)
                local var491 = tbl2.flag1 and tbl2.flag18
                if tbl2.infammo and var491 and not fn36(var488) then
                    if var490 ~= nil and maxAmmo ~= nil and var490 <= maxAmmo - 2 then
                        fn89(var488)
                    end
                elseif tbl2.autoreloadtazer and fn36(var488) then
                    if var490 ~= nil and var490 <= 0 then
                        fn89(var488)
                    end
                end
            end
        end
    end
end)
local function fn90()
    local var492 = var242
    if not tbl2.autoshoot or not tbl2.enabled or not var492 then
        return
    end
    if var492.Parent ~= localPlayer.Character then
        return
    end
    if not fn40(var492) then
        var251 = nil
        return
    end
    local var494 = os.clock()
    local var496 = var492:GetAttribute("Local_ReloadSession") or 0
    if var496 ~= 0 or var492:GetAttribute("Local_IsShooting") then
        return
    end
    if not fn46(var492) then
        return
    end
    local var497 = math.max(var492:GetAttribute("FireRate") or 0, tbl2.autoshootdelay)
    if var494 - num8 < var497 then
        return
    end
    local character14 = localPlayer.Character
    if not character14 then
        return
    end
    local head = character14:FindFirstChild("Head")
    if not head then
        return
    end
    local muzzle = var492:FindFirstChild("Muzzle")
    local var498 = muzzle and muzzle.Position or head.Position
    local var499, targetPos = fn85(tbl2.fov)
    if not var499 or not var423(var499) then
        var251 = nil
        return
    end
    if var499 ~= var251 then
        num9 = var494
        var251 = var499
    end
    local var500 = fn55(var492) and 0 or tbl2.autoshootstartdelay
    local var501 = math.max(var500, var492:GetAttribute("ChargeTime") or 0)
    if var494 - num9 < var501 then
        return
    end
    local targetPart = fn70(var499.Character)
    if not targetPart then
        return
    end
    local var502 = var492:GetAttribute("Range")
    if var502 and (targetPart.Position - var498).Magnitude > var502 + 5 then
        return
    end
    local var503 = var492:GetAttribute("Local_CurrentAmmo") or var492:GetAttribute("CurrentAmmo") or 0
    if var503 <= 0 then
        fn89(var492)
        return
    end
    num8 = var494
    local var504 = fn36(var492)
    local var505 = fn35(var492)
    local var506 = fn37(var492)
    local flag15 = false
    if tbl2.taseralwayshit and var504 then
        flag15 = true
    elseif tbl2.ifplayerstill and fn72(var499) then
        flag15 = true
    elseif fn44(var492) then
        flag15 = true
    else
        flag15 = fn81(fn82(targetPart, var498))
    end
    local var507 = var492:GetAttribute("ProjectileCount") or 1
    local tbl21 = {}
    for i3 = 1, var507 do
        local var508
        if flag15 then
            var508 = targetPart.Position
        else
            if tbl2.missspread > 0 then
                var508 = fn83(var498, targetPart)
            else
                return
            end
        end
        local var509 = flag15 and targetPart or nil
        local var510 = var508
        if flag15 then
            if var504 then
                local var511, simulatedPos = fn56(var498, var508, var492)
                var510 = simulatedPos
                var509 = var511 or targetPart
            elseif var506 and tbl2.shotgunnaturalspread then
                local var512, simulatedPos = fn56(var498, var508, var492)
                var510 = simulatedPos
                var509 = var512 or targetPart
            end
        end
        tbl21[i3] = {head.Position, var510, var509}
        fn86(var498, var510, var504)
    end
    shootEvent:FireServer(tbl21)
    if var492 ~= var242 or var492.Parent ~= localPlayer.Character then
        return
    end
    local var513 = var503 - 1
    var492:SetAttribute("Local_CurrentAmmo", var513)
    local var514 = fn87()
    if var514 then
        if var505 then
            var514.Text = var513 .. " | " .. (var492:GetAttribute("StoredAmmo") or 0)
        else
            var514.Text = var513 .. "/" .. (var492:GetAttribute("MaxAmmo") or 30)
        end
    end
    local handle = var492:FindFirstChild("Handle")
    if handle then
        local shootSound = handle:FindFirstChild("ShootSound")
        if shootSound then
            local var515 = shootSound:Clone()
            var515.Parent = handle
            var515:Play()
            Debris:AddItem(var515, 2)
        end
    end
end
local function fn91()
    local character15 = localPlayer.Character
    if not character15 then
        return nil
    end
    local children = character15:GetChildren()
    for i4 = #children, 1, -1 do
        local var516 = children[i4]
        if var516:IsA("Tool") and var516:GetAttribute("ToolType") == "Gun" then
            return var516
        end
    end
    return nil
end
local var517 = setmetatable({}, {__mode = "k"})
local function fn92(part)
    local var519 = var517[part]
    if not var519 then
        return
    end
    pcall(function()
        if part and part.Parent then
            part.Size = var519.Size
            part.CanCollide = var519.CanCollide
            part.Transparency = var519.Transparency
        end
    end)
    var517[part] = nil
end
local function fn93()
    for part in pairs(var517) do
        fn92(part)
    end
end
local function fn94()
    if not tbl2.hitboxenabled then
        fn93()
        return
    end
    local tbl22 = {}
    local team4 = localPlayer.Team
    local var522 = math.clamp(tonumber(tbl2.hitboxsize) or 8, 1, 30)
    for _, v14 in ipairs(Players:GetPlayers()) do
        if v14 ~= localPlayer and v14.Team ~= team4 then
            local character = v14.Character
            local var523 = character and character:FindFirstChildOfClass("Humanoid")
            local var524 = character and character:FindFirstChild("HumanoidRootPart")
            if var524 and var524:IsA("BasePart") and var523 and var523.Health > 0 then
                if not var517[var524] then
                    var517[var524] = {Size = var524.Size, CanCollide = var524.CanCollide, Transparency = var524.Transparency}
                end
                tbl22[var524] = true
                pcall(function()
                    var524.Size = Vector3.new(var522, var522, var522)
                    var524.CanCollide = false
                    var524.Transparency = 0.6
                end)
            end
        end
    end
    for part in pairs(var517) do
        if not tbl22[part] then
            fn92(part)
        end
    end
end
RunService.Heartbeat:Connect(function()
    pcall(fn94)
end)
local var525 = nil
local function fn95()
    local character = localPlayer.Character
    if not character then
        return nil
    end
    for _, v15 in ipairs(character:GetChildren()) do
        if v15:IsA("Tool") then
            return v15
        end
    end
    return nil
end
var124 = function()
    var525 = fn95()
end
var125 = function()
    local var526 = var525
    var525 = nil
    local character = localPlayer.Character
    local var527 = character and character:FindFirstChildOfClass("Humanoid")
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")
    if not var527 then
        return
    end
    if var526 and (var526.Parent == backpack or var526.Parent == character) then
        pcall(function()
            var527:EquipTool(var526)
        end)
    else
        pcall(function()
            var527:UnequipTools()
        end)
    end
end
local function fn96(arg30)
    if not arg30 then
        return true
    end
    local name = string.lower(arg30.Name):gsub("%s+", "")
    local var528 = string.lower(tostring(arg30:GetAttribute("Behavior") or ""))
    local var529 = string.lower(tostring(arg30:GetAttribute("Projectile") or ""))
    if fn36(arg30) or name:find("taser", 1, true) or name:find("tazer", 1, true) or var528 == "taser" or var528 == "tazer" or var529 == "taser" or var529 == "tazer" then
        return true
    end
    return false
end
local function fn97()
    local tbl23 = {}
    local backpack2 = localPlayer:FindFirstChildOfClass("Backpack")
    local character = localPlayer.Character
    local function fn98(container)
        if not container then
            return
        end
        for _, v16 in ipairs(container:GetChildren()) do
            if v16:IsA("Tool") and v16:GetAttribute("ToolType") == "Gun" and not fn96(v16) then
                table.insert(tbl23, v16)
            end
        end
    end
    fn98(backpack2)
    fn98(character)
    table.sort(tbl23, function(a, b)
        return a.Name < b.Name
    end)
    return tbl23
end
local function fn99(player)
    if not player or player == localPlayer or not player.Team then
        return false
    end
    local var530 = string.lower(player.Team.Name)
    local var531 = string.lower(tostring(tbl2.autoswitchteam or "Inmates"))
    if var531 == "police" then
        return var530 == "police" or var530 == "guards"
    elseif var531 == "criminal" or var531 == "criminals" then
        return var530 == "criminal" or var530 == "criminals"
    end
    return var530 == "inmate" or var530 == "inmates"
end
local function fn100()
    local character16 = localPlayer.Character
    local var532 = character16 and character16:FindFirstChild("HumanoidRootPart")
    if not var532 then
        return nil, nil
    end
    local var533, nearestPart, nearestDistance = nil, nil, math.huge
    local var534 = math.clamp(tonumber(tbl2.autoswitchdistance) or 500, 25, 1200)
    for _, player in ipairs(Players:GetPlayers()) do
        if fn99(player) then
            local character = player.Character
            local var535 = character and character:FindFirstChildOfClass("Humanoid")
            local var536 = character and character:FindFirstChild("HumanoidRootPart")
            local part = character and (character:FindFirstChild("Head") or character:FindFirstChild("Torso") or var536)
            if var535 and var535.Health > 0 and var536 and part and not (tbl2.ffcheck and character:FindFirstChildOfClass("ForceField")) then
                local distance = (var532.Position - var536.Position).Magnitude
                if distance <= var534 and distance < nearestDistance then
                    var533, nearestPart, nearestDistance = player, part, distance
                end
            end
        end
    end
    return var533, nearestPart
end
local num13 = 0
local num14 = 0
task.spawn(function()
    while true do
        if not tbl2.flag1 or not tbl2.flag18 then
            task.wait(0.02)
            continue
        end
        local character = localPlayer.Character
        local var537 = character and character:FindFirstChildOfClass("Humanoid")
        local var538 = character and character:FindFirstChild("Head")
        local var539 = fn97()
        local var540, targetPart = fn100()
        if not var537 or var537.Health <= 0 or not var538 or #var539 == 0 or not var540 or not targetPart then
            task.wait(0.02)
            continue
        end
        num13 = num13 % #var539 + 1
        local var541 = var539[num13]
        if var541 and var541.Parent ~= character then
            pcall(function()
                var537:EquipTool(var541)
            end)
            task.wait(0.01)
        end
        local character17 = localPlayer.Character
        local var542 = character17 and character17:FindFirstChild("Head")
        local var543 = var541 and var541:FindFirstChild("Muzzle")
        local var544 = var543 and var543.Position or var542 and var542.Position
        if tbl2.autoswitchwallcheck and var544 and var540.Character and fn75(var544, targetPart.Position, var540.Character) then
            task.wait(math.clamp(tonumber(tbl2.autoswitchfirerate) or 0.02, 0.01, 1))
            continue
        end
        local var545 = var541 and (var541:GetAttribute("Local_CurrentAmmo") or var541:GetAttribute("CurrentAmmo"))
        local var546 = var541 and (tonumber(var541:GetAttribute("Local_ReloadSession")) or 0) or 0
        local var547 = math.clamp(tonumber(tbl2.autoswitchfirerate) or 0.02, 0.01, 1)
        if var541 and var541.Parent == character17 and var546 == 0 and (tonumber(var545) or 0) <= 0 then
            if tbl2.autoswitchautoreload then
                fn89(var541)
            end
            task.wait(0.02)
            continue
        end
        local var548 = os.clock()
        if var541 and var541.Parent == character17 and var544 and (tonumber(var545) or 0) > 0 and var546 == 0 and var548 - num14 >= var547 then
            num14 = var548
            local var549 = pcall(function()
                shootEvent:FireServer({{var542.Position, targetPart.Position, targetPart}})
            end)
            if var549 then
                pcall(function()
                    if var541:GetAttribute("Local_CurrentAmmo") ~= nil then
                        var541:SetAttribute("Local_CurrentAmmo", math.max(0, (tonumber(var541:GetAttribute("Local_CurrentAmmo")) or 1) - 1))
                    end
                end)
                pcall(function()
                    fn86(var544, targetPart.Position, false)
                end)
            end
        end
        task.wait(var547)
    end
end)
local function fn101(title, text, duration)
    fn2(title, text, duration or 3)
end
local var550 = nil
fn43()
RunService.Heartbeat:Connect(function()
    local var551 = os.clock()
    var60()
    fn43()
    var242 = fn91()
    if var242 ~= var550 then
        fn26()
        var550 = var242
    end
    fn54(var551)
    fn90()
end)
RunService.PreRender:Connect(function()
    local currentCamera4 = workspace.CurrentCamera
    local var552 = fn34(currentCamera4)
    circle.Position = var552
    circle.Radius = tbl2.fov
    circle.Visible = tbl2.showfov and tbl2.enabled
    if tbl2.showtargetline and tbl2.enabled then
        local var553, targetPos = fn85()
        if var553 and targetPos and currentCamera4 then
            local var554, onScreen = currentCamera4:WorldToViewportPoint(targetPos)
            if onScreen then
                line.From = var552
                line.To = Vector2.new(var554.X, var554.Y)
                line.Visible = true
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end
    else
        line.Visible = false
    end
    fn63()
    fn66()
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    if input.KeyCode == tbl2.togglekey then
        tbl2.enabled = not tbl2.enabled
        fn18("enabled", tbl2.enabled)
        fn101("Silent Aim", "Enabled: " .. tostring(tbl2.enabled), 3)
    elseif input.KeyCode == tbl2.esptoggle then
        tbl2.esp = not tbl2.esp
        fn18("esp", tbl2.esp)
        fn101("ESP", "Enabled: " .. tostring(tbl2.esp), 3)
    elseif input.KeyCode == tbl2.c4esptoggle then
        tbl2.c4esp = not tbl2.c4esp
        fn18("c4esp", tbl2.c4esp)
        fn101("C4 ESP", "Enabled: " .. tostring(tbl2.c4esp), 3)
    end
end)
Players.PlayerRemoving:Connect(onPlayerRemoving)
local function onPlayerAdded(player)
    player.CharacterRemoving:Connect(function(arg31)
        tbl6[arg31] = nil
        tbl12[player] = nil
        if var246 and var246 == player then
            var246 = nil
        end
        if var251 and var251 == player then
            var251 = nil
        end
    end)
end
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)
local function fn102()
    for player, v17 in pairs(tbl10) do
        if v17 then
            v17:Destroy()
        end
        tbl10[player] = nil
    end
    for player, v18 in pairs(tbl11) do
        if v18 then
            pcall(function()
                v18:Destroy()
            end)
        end
        tbl11[player] = nil
    end
    tbl12 = {}
    tbl6 = {}
    var246 = nil
end
localPlayer:GetPropertyChangedSignal("Team"):Connect(function()
    fn26()
    fn102()
end)
var60 = function()
    local var555 = fn3()
    if var555 then
        fn4(var555)
        if flag then
            local var556 = math.clamp(tonumber(tbl2.movementwalkspeed) or num, 16, 200)
            if math.abs(var555.WalkSpeed - var556) > 0.01 then
                pcall(function()
                    var555.WalkSpeed = var556
                end)
            end
        end
        if flag4 then
            local var557 = math.clamp(tonumber(tbl2.movementjumppower) or num2, 50, 300)
            pcall(function()
                var555.UseJumpPower = true
                if math.abs(var555.JumpPower - var557) > 0.01 then
                    var555.JumpPower = var557
                end
            end)
        end
    end
    if flag2 then
        local var558 = math.clamp(tonumber(tbl2.movementgravity) or var54, 0, 300)
        if math.abs(Workspace.Gravity - var558) > 0.01 then
            pcall(function()
                Workspace.Gravity = var558
            end)
        end
    end
    local currentCamera5 = Workspace.CurrentCamera
    if currentCamera5 then
        fn5(currentCamera5)
        if flag3 then
            local var559 = math.clamp(tonumber(tbl2.movementfov) or num3, 70, 120)
            if math.abs(currentCamera5.FieldOfView - var559) > 0.01 then
                pcall(function()
                    currentCamera5.FieldOfView = var559
                end)
            end
        end
    end
end
UserInputService.JumpRequest:Connect(function()
    if not tbl2.infinityjump then
        return
    end
    local var560 = fn3()
    if var560 and var560.Health > 0 then
        pcall(function()
            var560:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end)
localPlayer.CharacterAdded:Connect(function(character)
    task.spawn(function()
        local humanoid5 = character:WaitForChild("Humanoid", 5)
        if humanoid5 then
            fn4(humanoid5)
            task.wait(0.1)
            var60()
        end
    end)
end)
local function fn103(fn)
    return function(...)
        return fn(...)
    end
end
local var561
local flag16 = false
local function fn104()
    local var562 = filtergc("function", {Name = "castRay"}, true)
    if not var562 then
        return false
    end
    var561 = hookfunction(var562, fn103(function(arg32, targetPos, ...)
        if not tbl2.enabled then
            return var561(arg32, targetPos, ...)
        end
        local var563 = fn85(tbl2.fov, true)
        if var563 and var563.Character then
            local var564 = var242
            if not var564 then
                return var561(arg32, targetPos, ...)
            end
            local var565 = fn36(var564)
            local var566 = fn37(var564)
            local var567 = fn46(var564)
            local flag17 = false
            local var568 = fn44(var564)
            local targetPart = fn70(var563.Character)
            if not targetPart then
                return var561(arg32, targetPos, ...)
            end
            if tbl2.shotgungamehandled and var566 then
                return var561(arg32, targetPart.Position, ...)
            end
            if tbl2.taseralwayshit and var565 then
                flag17 = true
            elseif tbl2.ifplayerstill and fn72(var563) then
                flag17 = true
            elseif var568 then
                flag17 = true
            else
                flag17 = fn81(fn82(targetPart, arg32))
            end
            if flag17 then
                if fn35(var564) and not var567 then
                    return var561(arg32, targetPart.Position, ...)
                end
                if var565 then
                    return var561(arg32, targetPart.Position, ...)
                end
                if tbl2.shotgunnaturalspread and var566 then
                    return var561(arg32, targetPart.Position, ...)
                end
                return targetPart, targetPart.Position
            else
                if tbl2.missspread > 0 then
                    local var569 = fn83(arg32, targetPart)
                    return var561(arg32, var569, ...)
                end
                return var561(arg32, targetPos, ...)
            end
        end
        return var561(arg32, targetPos, ...)
    end))
    return true
end
if not fn104() then
    task.spawn(function()
        while not flag16 do
            task.wait(0.5)
            if fn104() then
                flag16 = true
            end
        end
    end)
else
    flag16 = true
end
