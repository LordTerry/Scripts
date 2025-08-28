--//LUAVM RADIATION (TRIGGER ALERT!!!!)
local game =            game
local V3N =             Vector3.new
local V3Z =             Vector3.zero
local V3O =             Vector3.one
local V3XA =            Vector3.xAxis
local V3YA =            Vector3.yAxis
local V3ZA =            Vector3.zAxis
local CFN =             CFrame.new
local CFA =             CFrame.Angles
local CFI =             CFrame.identity
local CFR =             CFrame.fromRotationMatrix
local CFP =             CFrame.lookAt
local RAD =             math.rad
local DEG =             math.deg
local SIN =             math.sin
local COS =             math.cos
local ABS =             math.abs
local FLOOR =           math.floor
local CEIL =            math.ceil
local CLAMP =           math.clamp
local MAX =             math.max
local MIN =             math.min
local SQRT =            math.sqrt
local PI =              math.pi
local workspace =       workspace
local setmetatable =    setmetatable
local getmetatable =    getmetatable
local pcall =           pcall
local xpcall =          xpcall
local setfenv =         setfenv
local getfenv =         getfenv
local require =         require

--//funcs
local function __UD_SERVICE_LOADER__(srv) return cloneref(game:GetService(srv)) end

--//def
local RUN_SERVICE =                 __UD_SERVICE_LOADER__("RunService")
local PLAYERS =                     __UD_SERVICE_LOADER__("Players")
local COREGUI =                     __UD_SERVICE_LOADER__("CoreGui")
local USER_INPUT_SERVICE =          __UD_SERVICE_LOADER__("UserInputService")
local TWEEN_SERVICE =               __UD_SERVICE_LOADER__("TweenService")
local HTTP_SERVICE =                __UD_SERVICE_LOADER__("HttpService")
local STARTER_GUI =                 __UD_SERVICE_LOADER__("StarterGui")
local GUI_SERVICE =                 __UD_SERVICE_LOADER__("GuiService")
local LIGHTING =                    __UD_SERVICE_LOADER__("Lighting")
local CONTEXT_ACTION_SERVICE =      __UD_SERVICE_LOADER__("ContextActionService")
local REPLICATED_STORAGE =          __UD_SERVICE_LOADER__("ReplicatedStorage")
local STARTER_PLAYER =              __UD_SERVICE_LOADER__("StarterPlayer")
local PROXIMITY_PROMPT_SERVICE =    __UD_SERVICE_LOADER__("ProximityPromptService")
local TEXT_SERVICE =                __UD_SERVICE_LOADER__("TextService")
local TEXT_CHAT_SERVICE =           __UD_SERVICE_LOADER__("TextChatService")

local SERVER_PLAYERS =     PLAYERS:GetPlayers()
local LOCAL_PLAYER =       PLAYERS.LocalPlayer
local CHAR =               LOCAL_PLAYER.Character or LOCAL_PLAYER.CharacterAdded:Wait()
local HUM =                CHAR:WaitForChild("Humanoid")
local HRP =                CHAR:WaitForChild("HumanoidRootPart")

--//UNC related.
local SETHID = sethiddenproperty or set_hidden_property or set_hid_prop or function(i, p, v) i[p] = v end
local GETHID = gethiddenproperty or get_hidden_property or get_hid_prop or function(i, p) return i[p] end

--//Protected funccs
local function __set(i: Instance, p: string, v) xpcall(function() 
      SETHID(i, p, v) end, function()
      print("Error.")
    end) 
end
local function __get(i: Instance, p: string) xpcall(function() 
      GETHID(i, p) end, function()
      print("Error.")
    end) 
end
