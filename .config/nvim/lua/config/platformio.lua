vim.g.pioConfig = {
  lsp = 'clangd',          -- value: clangd | ccls
  clangd_source = 'ccls',  -- value: ccls | compiledb, For detailed explation check :help platformio-clangd_source
  menu_key = '<leader>\\', -- replace this menu key  to your convenience
  debug = false            -- enable debug messages
}

local pok, platformio = pcall(require, 'platformio')

if pok then platformio.setup(vim.g.pioConfig) end
if pok then
  platformio.setup({
    lsp = 'clangd', --default: ccls, other option: clangd
    -- If you pick clangd, it also creates compile_commands.json

    -- Uncomment out following line to enable platformio menu.
    menu_key = '<leader>\\',  -- replace this menu key  to your convenience
    menu_name = 'PlatformIO', -- replace this menu name to your convenience

    -- Following are the default keybindings, you can overwrite them in the config
    menu_bindings = {
      { node = 'item', desc = '[L]ist terminals',    shortcut = 'l', command = 'PioTermList' },
      { node = 'item', desc = '[T]erminal Core CLI', shortcut = 't', command = 'Piocmdf' },
      {
        node = 'menu',
        desc = '[G]eneral',
        shortcut = 'g',
        items = {
          { node = 'item', desc = '[B]uild',       shortcut = 'b', command = 'Piocmdf run' },
          { node = 'item', desc = '[U]pload',      shortcut = 'u', command = 'Piocmdf run -t upload' },
          { node = 'item', desc = '[M]onitor',     shortcut = 'm', command = 'Piocmdh run -t monitor' },
          { node = 'item', desc = '[C]lean',       shortcut = 'c', command = 'Piocmdf run -t clean' },
          { node = 'item', desc = '[F]ull clean',  shortcut = 'f', command = 'Piocmdf run -t fullclean' },
          { node = 'item', desc = '[D]evice list', shortcut = 'd', command = 'Piocmdf device list' },
        },
      },
      {
        node = 'menu',
        desc = '[P]latform',
        shortcut = 'p',
        items = {
          { node = 'item', desc = '[B]uild file system',  shortcut = 'b', command = 'Piocmdf run -t buildfs' },
          { node = 'item', desc = 'Program [S]ize',       shortcut = 's', command = 'Piocmdf run -t size' },
          { node = 'item', desc = '[U]pload file system', shortcut = 'u', command = 'Piocmdf run -t uploadfs' },
          { node = 'item', desc = '[E]rase Flash',        shortcut = 'e', command = 'Piocmdf run -t erase' },
        },
      },
      {
        node = 'menu',
        desc = '[D]ependencies',
        shortcut = 'd',
        items = {
          { node = 'item', desc = '[L]ist packages',     shortcut = 'l', command = 'Piocmdf pkg list' },
          { node = 'item', desc = '[O]utdated packages', shortcut = 'o', command = 'Piocmdf pkg outdated' },
          { node = 'item', desc = '[U]pdate packages',   shortcut = 'u', command = 'Piocmdf pkg update' },
        },
      },
      {
        node = 'menu',
        desc = '[A]dvanced',
        shortcut = 'a',
        items = {
          { node = 'item', desc = '[T]est',                 shortcut = 't', command = 'Piocmdf test' },
          { node = 'item', desc = '[C]heck',                shortcut = 'c', command = 'Piocmdf check' },
          { node = 'item', desc = '[D]ebug',                shortcut = 'd', command = 'Piocmdf debug' },
          { node = 'item', desc = 'Compilation Data[b]ase', shortcut = 'b', command = 'Piocmdf run -t compiledb' },
          {
            node = 'menu',
            desc = '[V]erbose',
            shortcut = 'v',
            items = {
              { node = 'item', desc = 'Verbose [B]uild',  shortcut = 'b', command = 'Piocmdf run -v' },
              { node = 'item', desc = 'Verbose [U]pload', shortcut = 'u', command = 'Piocmdf run -v -t upload' },
              { node = 'item', desc = 'Verbose [T]est',   shortcut = 't', command = 'Piocmdf test -v' },
              { node = 'item', desc = 'Verbose [C]heck',  shortcut = 'c', command = 'Piocmdf check -v' },
              { node = 'item', desc = 'Verbose [D]ebug',  shortcut = 'd', command = 'Piocmdf debug -v' },
            },
          },
        },
      },
      {
        node = 'menu',
        desc = '[R]emote',
        shortcut = 'r',
        items = {
          { node = 'item', desc = 'Remote [U]pload',  shortcut = 'u', command = 'Piocmdf remote run -t upload' },
          { node = 'item', desc = 'Remote [T]est',    shortcut = 't', command = 'Piocmdf remote test' },
          { node = 'item', desc = 'Remote [M]onitor', shortcut = 'm', command = 'Piocmdh remote run -t monitor' },
          { node = 'item', desc = 'Remote [D]evices', shortcut = 'd', command = 'Piocmdf remote device list' },
        },
      },
      {
        node = 'menu',
        desc = '[M]iscellaneous',
        shortcut = 'm',
        items = {
          { node = 'item', desc = '[U]pgrade PlatformIO Core', shortcut = 'u', command = 'Piocmdf upgrade' },
        },
      },
    },
  })
end
