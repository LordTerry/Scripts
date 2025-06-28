-- // FUCK ADONIS
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

