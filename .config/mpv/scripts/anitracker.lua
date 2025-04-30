local mp = require('mp')
local utils = require('mp.utils')
local input = require('mp.input')

local function select_anime(path)
  local menu = {
    type = 'anime_selector',
    title = "Searching...",
    search_style = 'disabled',
    items = { { icon = 'spinner', align = 'center', selectable = false, muted = true } },
  }
  mp.commandv('script-message-to', 'uosc', 'open-menu', utils.format_json(menu))

  local command = { args = { "python", mp.command_native({ "expand-path", "~~/script-opts/anitracker.py" }), "--search", path } }
  local result = utils.subprocess(command)
  local animes = utils.parse_json(result.stdout)

  if result.status ~= 0 or #animes == 0 then
    menu = {
      type = "anime_selector",
      search_style = "disabled",
      items = {
        { title = "Couldn't find anime with that name :(", align = "center", selectable = false, muted = true, bold = true },
      }
    }
    mp.commandv('script-message-to', 'uosc', 'update-menu', utils.format_json(menu))
  else
    menu = {
      type = "anime_selector",
      title = "Select an anime",
      callback = { mp.get_script_name(), 'menu-event' },
      items = {}
    }
    for i, anime in ipairs(animes) do
      menu.items[i] = {
        title = anime.title.english,
        hint = tostring(anime.episodes),
        value = tostring(anime.id)
      }
    end

    mp.commandv('script-message-to', 'uosc', 'update-menu', utils.format_json(menu))
  end
end

local function update_anime(json)
  local event = utils.parse_json(json)
  if event.type == 'activate' then
    local menu = {
      type = 'anime_selector',
      title = "Updating...",
      search_style = 'disabled',
      items = { { icon = 'spinner', align = 'center', selectable = false, muted = true } },
    }
    mp.commandv('script-message-to', 'uosc', 'update-menu', utils.format_json(menu))

    local path = mp.get_property("path")
    local command = { args = { "python", mp.command_native({ "expand-path", "~~/script-opts/anitracker.py" }), "--id", event.value, "--title", path } }
    local result = utils.subprocess(command)

    if result.status == 0 then
      log("Updated anilist entry :)")
    else
      log("Failed to update anilist entry :(")
    end

    mp.commandv('script-message-to', 'uosc', 'close-menu', 'anime_selector')
  end
end

local function get_path()
  local path = mp.get_property("path")
  input.get({ prompt = "Enter anime name:", default_text = path, submit = select_anime })
end

function log(string, secs)
  secs = secs or 2.5
  mp.msg.warn(string)
  mp.osd_message(string, secs)
end

mp.add_key_binding('a', 'anitracker', get_path)
mp.register_script_message('menu-event', update_anime)
