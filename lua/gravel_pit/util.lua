local util = {}
local theme = require("gravel_pit.theme")
local config = require("gravel_pit.config").options

util.Style = {
  LIGHT = "LIGHT",
  DARK = "DARK",
}

-- Go trough the table and highlight the group with the color values
util.highlight = function(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

-- Load the theme
function util.load(style)
  -- Set the theme environment
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  if style == util.Style.DARK then
    vim.opt.background = "dark"
    vim.g.colors_name = "gravel-pit-dark"
  -- vim.notify("loading gravel_pit_dark")
  elseif style == util.Style.LIGHT then
    vim.opt.background = "light"
    vim.g.colors_name = "gravel-pit-light"
  end
  vim.opt.termguicolors = true
  --
  if config.disable.colored_cursor == false then
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor/Cursor"
    vim.cmd([[autocmd ExitPre * set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20]])
  end
  --
  -- Load plugins and custom highlights
  -- Import the table for plugins
  local plugins = theme.loadPlugins(style)

  -- Apply the terminal colors
  if config.disable.term_colors == false then
    theme.loadTerminal(style)
  end

  -- Apply the plugin colors
  for group, colors in pairs(plugins) do
    util.highlight(group, colors)
  end

  -- Apply user defined highlights if they exist
  if type(config.custom_highlights) == "table" then
    for group, colors in pairs(config.custom_highlights) do
      util.highlight(group, colors)
    end
  end

  -- Import tables for the base, syntax, treesitter and lsp
  local editor = theme.loadEditor(style)
  local syntax = theme.loadSyntax(style)
  local treesitter = theme.loadTreeSitter(style)
  local lsp = theme.loadLSP(style) -- TODO This is the source of this strange startup error

  -- Apply base colors
  for group, colors in pairs(editor) do
    util.highlight(group, colors)
  end

  -- Apply basic syntax colors
  for group, colors in pairs(syntax) do
    util.highlight(group, colors)
  end

  -- Apply treesitter colors
  for group, colors in pairs(treesitter) do
    util.highlight(group, colors)
  end

  -- Apply lsp colors
  for group, colors in pairs(lsp) do
    util.highlight(group, colors)
  end
end

return util
