-- // [Netless / Netbypass] \\

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

-- // VARS
local GLOBAL = _G or getgenv()
if not GLOBAL._FILTERED then loadstring(game:HttpGet("https://raw.githubusercontent.com/LordTerry/Scripts/refs/heads/main/Instance_filter.lua"))() end 
local SET_HID = function(i, p, v) pcall(function() sethiddenproperty(i, p, v) end) end 
local SETTINGS = {
    ["NETLESS_VEL"] = 26.6565464,
    ["USE_VELOCITY_PROP"] = false,
    ["DEBUG"] = false
}

-- // QUICK SETTINGS
settings()["Physics"].AllowSleep = false
settings()["Physics"].PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings()["Physics"].ThrottleAdjustTime = math.huge
settings()["Physics"].DisableCSGv2 = true
settings()["Physics"].ForceCSGv2 = true
settings()["Physics"].UseCSGv2 = true

if SETTINGS.DEBUG then
settings()["Physics"].AreOwnersShown = true
settings()["Physics"].AreRegionsShown = true
end
workspace.StreamingEnabled = false

RUN_SERVICE.PreSimulation:Connect(function()
    for _, v in pairs(SERVER_PLAYERS) do
        if v ~= LOCAL_PLAYER then
            SET_HID(v, "SimulationRadius", 0)
            SET_HID(v, "MaximumSimulationRadius", 0)
            SET_HID(v, "MaxSimulationRadius", 0)
        else
            SET_HID(v, "MaximumSimulationRadius", 9e9)
            SET_HID(v, "MaxSimulationRadius", 9e9)
            SET_HID(v, "SimulationRadius", 9e9)
        end
    end
    
    for _, v in GLOBAL._FILTERED do
        if SETTINGS.USE_VELOCITY_PROP then SET_HID(v, "Velocity", Vector3.new(SETTINGS.NETLESS_VEL, SETTINGS.NETLESS_VEL, SETTINGS.NETLESS_VEL))
        else SET_HID(v, "AssemblyLinearVelocity", Vector3.new(SETTINGS.NETLESS_VEL, SETTINGS.NETLESS_VEL, SETTINGS.NETLESS_VEL)) end
        SET_HID(v, "RootPriority", 127)
        SET_HID(v, "Massless", true)
        SET_HID(v, "CanCollide", false)
        SET_HID(v, "CanTouch", false)
        SET_HID(v, "CanQuery", false)
        SET_HID(v, "NetworkIsSleeping", false)
        SET_HID(v, "CustomPhysicalProperties", PhysicalProperties.new(0, 0, 0, 0, 0))
    end
end)
