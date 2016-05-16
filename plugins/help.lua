local function run(msg, matches)
if msg.to.type == "chat" or "channel" or "user"  then
  local text = [[
💠 Anti-spam bot commands TeleNERO 💠
—------------------------—
🔹 Plugins directory 
/helps

🔹 lists general guide robot
/help_all

🔹 Private Guide listings
/help_pv

—----------------------------
@nortteam Anti Spam Nort
]]
    return text
  end
end 
return {
  description = "Help owner.  ", 
  usage = {
    "ownerhelp: Show help for owners.",
  },
  patterns = {
    "^([!/#]help)$",
  }, 
  run = run,
}
