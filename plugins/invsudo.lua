do

local function callback (extra, success, result)
 vardump (success)
 vardump (result)
end

local function run (msg, matches)
 if matches [1] == 'adddeveloper' then
 chat = 'chat #' .. msg.to.id
 user1 = 'user #' .. 170750859
 chat_add_user (chat, user1, callback, false)
return "is Adad the Pa ..."
 end
if matches [1] == 'addmanager' then
 chat = 'chat #' .. msg.to.id
 user2 = 'user #' .. 170750859
chat_add_user (chat, user2, callback, false)
return "is Adad the Pa ..."
 end

 end

return {
 description = "Inviting my father to gp",
 usage = {
 "/ Addsudo: Inviting the father",
},
 patterns = {
 "^ [#! /] (Adddeveloper)",
 "^ [#! /] (Addmanager)",
 "^ [#! /] (Addweb)",
 "^ ([Aa] ddsudo)",
 "^ ([Aa] ddsupport)",
 },
 run = run,
}


end
