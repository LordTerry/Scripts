-- // [Instance filter] \\

-- // Terry's Default initialization
function __UNDETECTED__SERVICE__LOADER__(service: string)
    -- // INITIALIZATION
    local __SERVICE__ORIGINAL__ = game:FindFirstChildWhichIsA(service) or game:GetService(service) -- // FindFirstChildWhichIsA Helps finding services pre-loaded more faster.
    local __SERVICE__PROXY__ = newproxy(true)
			   local __METATABLE__ = getmetatable(__SERVICE__PROXY__)
			   
    -- // CREATES NECESSARY METAMETHODS FOR THE NEW PROXY.
    function __METATABLE__:__newindex(key: string, value: any)
        __SERVICE__ORIGINAL__[key] = value
			   end
			   function __METATABLE__:__index(key: string)
			        local __index = __SERVICE__ORIGINAL__[key]
				        if type(__index) == "function" then
				            return function(self, ...)
				                return __index(__SERVICE__ORIGINAL__, ...)
				            end
				        end
				        return __index
			   end
    
    -- // LOCKING...
			   __METATABLE__.__type = "Instance"
			   __METATABLE__.__metatable = "Locked."
			
			   return __SERVICE__PROXY__
		end

-- // SOME VARIABLES
local RUN_SERVICE = __UNDETECTED__SERVICE__LOADER__("RunService")
local PLAYERS = __UNDETECTED__SERVICE__LOADER__("Players")
local COREGUI = __UNDETECTED__SERVICE__LOADER__("CoreGui")
local USER_INPUT_SERVICE = __UNDETECTED__SERVICE__LOADER__("UserInputService")
local TWEEN_SERVICE = __UNDETECTED__SERVICE__LOADER__("TweenService")
local HTTP_SERVICE = __UNDETECTED__SERVICE__LOADER__("HttpService")
local STARTER_GUI = __UNDETECTED__SERVICE__LOADER__("StarterGui")
local GUI_SERVICE = __UNDETECTED__SERVICE__LOADER__("GuiService")
local LIGHTING = __UNDETECTED__SERVICE__LOADER__("Lighting")
local CONTEXT_ACTION_SERVICE = __UNDETECTED__SERVICE__LOADER__("ContextActionService")
local REPLICATED_STORAGE = __UNDETECTED__SERVICE__LOADER__("ReplicatedStorage")
local STARTER_PLAYER = __UNDETECTED__SERVICE__LOADER__("StarterPlayer")
local PROXIMITY_PROMPT_SERVICE = __UNDETECTED__SERVICE__LOADER__("ProximityPromptService")
local TEXT_SERVICE = __UNDETECTED__SERVICE__LOADER__("TextService")
local TEXT_CHAT_SERVICE = __UNDETECTED__SERVICE__LOADER__("TextChatService")
local SERVER_PLAYERS = PLAYERS:GetPlayers()
local LOCAL_PLAYER = PLAYERS.LocalPlayer
local CHAR = LOCAL_PLAYER.Character or LOCAL_PLAYER.CharacterAdded:Wait()
local HUM = CHAR:WaitForChild("Humanoid")
local HRP = CHAR:WaitForChild("HumanoidRootPart")
local GLOBAL = _G or getgenv()
if GLOBAL._FILTERED then return end
local TRASH = {"Light", "ParticleEmitter", "Fire", "Smoke",
               "Beam", "Trail", "Explosion", "Sound",
               "BodyPosition", "AlignPosition", "LinearPosition",
               "BodyVelocity", "RocketPropulsion", "VectorForce",
               "LinearConstraints", "AlignOrientation", "Torque",
               "AngularVelocity", "HingeConstraint", "BallSocketConstraint",
               "CylindricalConstraint", "AngularConstraint", "BodyGyro",
               "BodyAngularVelocity", "BodyForce", "BodyThrust", "BodyLift",
               "BodyMover", "Attachment", "NoCollisionConstraint",
               "RodConstraint", "SpringConstraint", "PrismaticConstraint",
               "TorsionSpringConstraint", "WeldConstraint". "ManualWeld",
               "Motor", "Motor6D", "Snap", "PlaneConstraint", "RopeConstraint", "UniversalConstraint",
	       "LineForce"} 
local CHARACTER_LIMBS = {Head=1, Torso=1, ["Left Arm"]=1, ["Right Arm"]=1, ["Left Leg"]=1, ["Right Leg"]=1,
                         HumanoidRootPart=1, Handle=1, UpperTorso=1, LowerTorso=1, LeftUpperArm=1, LeftLowerArm=1,
                         LeftHand=1, RightUpperArm=1, RightLowerArm=1, RightHand=1, LeftUpperLeg=1,
                         LeftLowerLeg=1, LeftFoot=1, RightUpperLeg=1, RightLowerLeg=1, RightFoot=1}
local SETTINGS = {
  ["USE_RECEIVE_AGE"] = true,
  ["DELETE_TRASH"] = true,
  ["DEBUG"] = true
}

GLOBAL._FILTERED = {}

function __TRASH__HANDLER__(v: Instance)
    v.CastShadow = false
    for _, _v_ in pairs(v:GetDescendants()) do
        for __, __v__ in TRASH do
           if _v_:IsA(__v__) then
              _v_:Destroy()  
           end
        end
    end
end

function __FILTER__(v: Instance)
    if v:IsA("BasePart") and not CHARACTER_LIMBS[v.Name] and not v:IsDescendantOf(CHAR) 
    and v.AssemblyRootPart and not v.AssemblyRootPart.Anchored and not v.Anchored then
        if SETTINGS.USE_RECEIVE_AGE == true and v.ReceiveAge == 0 then
           GLOBAL._FILTERED[v] = true
           return true
        end
        GLOBAL._FILTERED[v] = true
        return true
    else return false end
end

for _, v in pairs(workspace:GetDescendants()) do
    __FILTER__(v)
    if SETTINGS.DELETE_TRASH == true then __TRASH__HANDLER__(v) end
end
workspace.DescendantAdded:Connect(function(v) 
    if v:IsA("BasePart") then
        task.wait(0.5)
        __FILTER__(v)
        if SETTINGS.DELETE_TRASH == true then __TRASH__HANDLER__(v) end
    end
end)
workspace.DescendantRemoving:Connect(function(v)
    if GLOBAL._FILTERED[v] then GLOBAL._FILTERED[v] = nil end
    if SETTINGS.DELETE_TRASH == true then __TRASH__HANDLER__(v) end
end)

RUN_SERVICE.Heartbeat:Connect(function()
     for v in GLOBAL._FILTERED do
        if not v or not v.Parent then GLOBAL._FILTERED[v] = nil
        elseif SETTINGS.USE_RECEIVE_AGE == true and v.ReceiveAge == 0 then GLOBAL._FILTERED[v] = true
        if SETTINGS.DELETE_TRASH == true then __TRASH__HANDLER__(v) end end
     end
end)

if SETTINGS.DEBUG == true then
   task.defer(function()
       while task.wait() do
          for v in pairs(GLOBAL._FILTERED) do 
              if v.Parent then
                 v.Color = Color3.fromRGB(255, 0, 0)
              end
          end
       end
   end)
end
