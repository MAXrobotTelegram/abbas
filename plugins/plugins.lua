do

- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled (name)
  for k, v in pairs (_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  - If not found
  return false
end

- Returns true if file exists in plugins folder
local function plugin_exists (name)
  for k, v in pairs (plugins_names ()) do
    if name .. '. lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins (only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs (plugins_names ()) do
    - ✔ enabled, ❌ disabled
    local status = '❌'
    nsum = nsum + 1
    nact = 0
    - Check if is enabled
    for k2, v2 in pairs (_config.enabled_plugins) do
      if v == v2 .. '. lua' then
        status = '✔'
      end
      nact = nact + 1
    end
    if not only_enabled or status == '✔' then
      - Get the name
      v = string.match (v, "(. *)%. lua")
      text = text..nsum .. '. '..v ..' '..status ..' \ N '
    end
  end
  local text = text .. '\ n' ..nsum .. 'plugin installed \ n' .. nact .. 'plug-active and' ..nsum-nact .. 'disabled'
  return text
end

local function list_plugins (only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs (plugins_names ()) do
    - ✔ enabled, ❌ disabled
    local status = '❌'
    nsum = nsum + 1
    nact = 0
    - Check if is enabled
    for k2, v2 in pairs (_config.enabled_plugins) do
      if v == v2 .. '. lua' then
        status = '✔'
      end
      nact = nact + 1
    end
    if not only_enabled or status == '✔' then
      - Get the name
      v = string.match (v, "(. *)%. lua")
      text = text..v .. '' ..status .. '\ n'
    end
  end
  local text = text .. '\ n' .. nact .. 'Activate the plugin' ..nsum .. 'plug-in server.'
  return text
end

local function reload_plugins ()
  plugins = {}
  load_plugins ()
  return list_plugins (true)
end


local function enable_plugin (plugin_name)
  print ( 'checking if' ..plugin_name .. 'exists')
  - Check if plugin is enabled
  if plugin_enabled (plugin_name) then
    return 'plug' ..plugin_name .. 'activated'
  end
  - Checks if plugin exists
  if plugin_exists (plugin_name) then
    - Add to the config table
    table.insert (_config.enabled_plugins, plugin_name)
    print (plugin_name .. 'added to _config table')
    save_config ()
    - Reload the plugins
    return reload_plugins ()
  else
    return 'plug' ..plugin_name .. 'found'
  end
end

local function disable_plugin (name, chat)
  - Check if plugins exists
  if not plugin_exists (name) then
    return 'plug' ..name .. 'found'
  end
  local k = plugin_enabled (name)
  - Check if plugin is enabled
  if not k then
    return 'plug' ..name .. 'disabled'
  end
  - Disable and reload
  table.remove (_config.enabled_plugins, k)
  save_config ()
  return reload_plugins (true)
end

local function disable_plugin_on_chat (receiver, plugin)
  if not plugin_exists (plugin) then
    return "plugin not found."
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat [receiver] then
    _config.disabled_plugin_on_chat [receiver] = {}
  end

  _config.disabled_plugin_on_chat [receiver] [plugin] = true

  save_config ()
  return 'plug' ..plugin .. 'in this group disabled'
end

local function reenable_plugin_on_chat (receiver, plugin)
  if not _config.disabled_plugin_on_chat then
    return 'This plugin is disabled'
  end

  if not _config.disabled_plugin_on_chat [receiver] then
    return 'There aren \' t any disabled plugins for this chat '
  end

  if not _config.disabled_plugin_on_chat [receiver] [plugin] then
    return 'This plugin is not disabled'
  end

  _config.disabled_plugin_on_chat [receiver] [plugin] = false
  save_config ()
  return 'plug' ..plugin .. 're-activated'
end

local function run (msg, matches)
  - Show the available plugins
  if matches [1] == 'plug' and is_sudo (msg) then --after changed to moderator mode, set only sudo
    return list_all_plugins ()
  end

  - Re-enable a plugin for this chat
  if matches [1] == '+' and matches [3] == 'chat' then
    local receiver = get_receiver (msg)
    local plugin = matches [2]
    print ( "enable" ..plugin .. 'on this chat')
    return reenable_plugin_on_chat (receiver, plugin)
  end

  - Enable a plugin
  if matches [1] == '+' and is_sudo (msg) then --after changed to moderator mode, set only sudo
    local plugin_name = matches [2]
    print ( "enable:" ..matches [2])
    return enable_plugin (plugin_name)
  end

  - Disable a plugin on a chat
  if matches [1] == '-' and matches [3] == 'chat' then
    local plugin = matches [2]
    local receiver = get_receiver (msg)
    print ( "disable" ..plugin .. 'on this chat')
    return disable_plugin_on_chat (receiver, plugin)
  end

  - Disable a plugin
  if matches [1] == '-' and is_sudo (msg) then --after changed to moderator mode, set only sudo
    if matches [2] == 'plugins' then
    return 'This plugin can \' t be disabled '
    end
    print ( "disable:" ..matches [2])
    return disable_plugin (matches [2])
  end

  - Reload all the plugins!
  if matches [1] == '*' and is_sudo (msg) then --after changed to moderator mode, set only sudo
    return reload_plugins (true)
  end
end

return {
  description = "Plugin to manage other plugins. Enable, disable or reload.",
  usage = {
      moderator = {
          "! Plugins disable [plugin] chat: Disable specific plug in a group",
          "! Plugins enable [plugin] chat: Enabling a particular plug-in",
          },
      sudo = {
          "! Plugins: Show all plugins" directory,
          "! Plugins enable [plugin]: activate the plugin."
          "! Plugins disable [plugin]: Disable specific plug-ins",
          "! Plugins reload: activate all plugins"},
          },
  patterns = {
    "^ Plug $",
    "^ Plug (+) ([% w _%.% -] +) $",
    "^ Plug (-) ([% w _%.% -] +) $",
    "^ Plug (+) ([% w _%.% -] +) (Chat)",
    "^ Plug (-) ([% w _%.% -] +) (Chat)",
    "^ Plug (*) $"},
  run = run,
  moderated = true, - set to moderator mode
  --privileged = true
}

end
