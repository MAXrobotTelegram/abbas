local function run(msg, matches)
if msg.to.type == "chat" or "channel" or "user"  then
  local text = [[
💠 دستورات ربات ضد اسپم نورت 💠
—------------------------—
🔹Plugins directory 
/helps

�Lists general guide robot
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
