--//LOCAL PLAYER RELATED THINGS
local PLRS = game.Players
local PLR = PLRS.LocalPlayer
local CHAR = PLR.Character or PLR.CharacterAdded:Wait()
local HRP = CHAR:WaitForChild("HumanoidRootPart")
local HUM = CHAR:WaitForChild("Humanoid")

--//TARGET?
local TARGET = PLRS["MegaSkidOfAlISkids"]
local TCHAR = TARGET.Character or TARGET.CharacterAdded:Wait()
local THRP = TCHAR:WaitForChild("HumanoidRootPart")
local THUM = TCHAR:WaitForChild("Humanoid")
local _OLD = THRP.CFrame

--//FUNCS
function SETTUP(NAME, H)
  if CHAR:FindFirstChild(NAME) then
    CHAR[NAME].Parent = PLR.Backpack
  end
  TOOL = PLR.Backpack[NAME]
  getgenv().__OLD = TOOL.GripPos
  
  TOOL.GripPos = Vector3.new(-H, 1.5, 0.5)
  TOOL.Parent = CHAR
  TOOL.Handle.Name = "_"
end
function DESETTUP(NAME)
  if CHAR:FindFirstChild(NAME) then
    CHAR[NAME].Parent = PLR.Backpack
  end
  TOOL = PLR.Backpack[NAME]
  TOOL["_"].Name = "Handle"
  TOOL.GripPos = getgenv().__OLD
end 

--//MAIN CODE IDK
SETTUP("Sword", 1000)

for _, v in pairs(TCHAR:GetChildren()) do
  if v:IsA("BasePart") then
    v.Size = Vector3.new(50, 50, 50)
  end
end
THRP.CFrame = HRP.CFrame + Vector3.new(0, 999, 0)
THRP.Anchored = true
task.wait(1)
THRP.Anchored = false
THRP.CFrame = OLD

DESETTUP("Sword")

