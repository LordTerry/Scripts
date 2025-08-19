-- // Terry's Default initialization
--//LUAVM RADIATION (TRIGGER ALERT!!!!)
local game = game
local V3N = Vector3.new
local V3Z = Vector3.zero
local workspace = workspace
local setmetatable = setmetatable
local getmetatable = getmetatable
local pcall = pcall
local setfenv = setfenv
local getfenv = getfenv
local require = require

--//funcs
local function __UD_SERVICE_LOADER__(srv) return cloneref(srv) end

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
