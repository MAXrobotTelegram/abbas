local function history (extra, suc, result)
for i = 1, #result do
delete_msg (result [i] .id, ok_cb, false)
end
if tonumber (extra.con) == #result then
send_msg (extra.chatid, '' .. # result .. 'recent message was deleted ', ok_cb, false)
else
send_msg (extra.chatid, 'All messages will delete super groups', ok_cb, false)
end
end
local function run (msg, matches)
if matches [1] == 'msgrem' and is_owner (msg) then
            if msg.to.type == 'channel' then
            if tonumber (matches [2])> 9999 or tonumber (matches [2]) <1 then
            return "error selected number should be below 100."
            end
            get_history (msg.to.peer_id, matches [2] + 1, history, {chatid = msg.to.peer_id, con = matches [2]})
        else
                         return "is only for Super group"
        end
else
return "is only for managers"
end
end
return {
    patterns = {
        '^ [! / #] (Msgrem) (% d *) $'
    },
    run = run
}
