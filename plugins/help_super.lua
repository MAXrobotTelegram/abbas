local function run(msg, matches)
if is_momod(msg) and msg.to.type == "channel" then        
  local text = [[


💢 !info
All information is about Super Group shows

💢 !admins
Admin list of Super Group

💢!owner
The name of the owner of Super Group

💢 !modlist
Please list the Super Group

💢!bots
Bot List Super Group

!who
List all the members of Super Group

💢 !block
Expulsion and ban a user of Super Group (formally the Telegram)

💢 !ban
Ben the one of Super Group (unofficially from the Baht)

💢 !unban
The son of the one of Super Group

💢 !id
Show ID Super group / individual ID
- For the user Idi are:! Id @UserName

💢 !id from
Get the ID of the message that was forwarded

💢 !kickme
Fired up one of Super Group

💢 !setowner
Replace the Super Group

💢 !promote [username|id]
A person promoted to director

💢 !demote [username|id]
Demoted to an ordinary member

💢 !setname
Rename Super Group

💢 !setphoto
Swap photos Super Group

💢 !setrules
Writing Rules Super Group

💢!setabout
Write "About" Super Group (membranes comes top of the list)

💢 !save [value] <text>
Storage of additional information in relation to Chat

💢 !get [value]
The same thing is you get your high comment 😐

💢 !newlink
Construction of new link

💢 !link
Catch Link Group

💢 !rules
Group Rules

💢! Lock [links | flood | spam | Arabic | member | rtl | sticker | contacts | strict]
Lock settings Group
* RTL = Right Align (messages from right to left) *
* Strict: enable strict settings enforcement (violating user will be kicked) *

💢! Unlock [links | flood | spam | Arabic | member | rtl | sticker | contacts | strict]
Open settings Group
* RTL = Right Align (messages from right to left) *
* Strict: disable strict settings enforcement (violating user will not be kicked) *

💢! Mute [all | audio | gifs | photo | video | service]
Miout (choke) off
- Messages are immediately deleted Miout

💢! Unmute [all | audio | gifs | photo | video | service]
Miout it out
💢! Setflood [value]
Is the number of consecutive messages to the user's cake
- For example, if 10 individual 10 to also send the message, the cake.

💢! Settings
Download settings Super Group

💢! Muteslist
Show Miout Super Group

💢! Muteuser [username]
The strangling of a user in the Super Group
- If the user smothered send messages, deleted messages situ

💢! Mutelist
List of people Miout

💢! Banlist
List of Banned

💢! Clean [rules | about | modlist | mutelist]
Remove one of the above variables

💢! Del
Delete a message (not Ryplay)

💢! Public [yes | no]
Vyzybylyty messages

💢! Res [username]
Get the name and ID of a user with the username (eg @UserName)

💢! Addword [word]
Censor a word

💢! Remword [word]
Delete a word from the list of censors

💢! Badwords
List of censored words.

💢! Log
Download logs Group
* For example, if you search for a cake of [#RTL | #spam | #lockmember]


🔴Shma just three characters # and! And / or at the beginning of the command to use.

🔴Fqt owner of Super Group through Adad Adad users can be a member of.

🔴Fqt director and owner of Super Group can block, Ben, Nbn, new links, links, sets out the photos, is a name, lock, unlock, set the rules, is a description and use settings.

🔴Fqt owner and admins can command the res, promote, setowner use.


Channel link: @TeleNERObot
]]
    send_msg("channel#id"..msg.to.id, text, ok_cb, false)
  end
end 
return {
  description = "Help owner.  ", 
  usage = {
    "ownerhelp: Show help for owners.",
  },
  patterns = {
    "^([!/#]help_all)$",
  }, 
  run = run,
}
