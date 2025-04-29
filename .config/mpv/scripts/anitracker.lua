local mp = require('mp')
local utils = require('mp.utils')
local input = require('mp.input')

local function update(path)
  log("Updating anilist entry...", 90)
  local table = { args = { "python", mp.command_native({ "expand-path", "~~/script-opts/anitracker.py" }), path } }
  local result = utils.subprocess(table)
  if result.status == 0 then
    log("Updated anilist entry :)")
  else
    log("Failed to update anilist entry :(")
  end
end

local function get_path()
  local path = mp.get_property("path")
  input.get({ prompt = "Enter anime name:", default_text = path, submit = update })
end

function log(string, secs)
  secs = secs or 2.5
  mp.msg.warn(string)
  mp.osd_message(string, secs)
end

mp.add_key_binding('a', 'anitracker', get_path)
