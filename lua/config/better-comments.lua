-- Functions
local function add_matches_group(name, rules)
  local containedin_vimscript = {
    'MultilineComment',
    'LineComment',
    'DocComment',
    'Comment'
  }

  -- Get the syntax prefix from the buffer variable
  local b_bettercomments_syntax_prefix = vim.b.bettercomments_syntax_prefix or ''

  -- Map the vimscript names to actual syntax groups with the prefix
  local containedin_lua = vim.tbl_map(function(val)
    return b_bettercomments_syntax_prefix .. val
  end, containedin_vimscript)

  -- Add 'Comment' to the list if not already there,
  -- although the original Vimscript adds it always at the end.
  -- Lua's string.format is better for constructing commands.
  local containedin_final = table.concat(containedin_lua, ',') .. ',Comment'

  -- Define the main match group
  local match_pattern_main = string.format([[\(^\s*\)\@<=\([^0-9A-Za-z_ ]\+ *\)\? \?\(\%%(%s\)\)...\+]], table.concat(rules, '\\|'))
  vim.cmd(string.format('syn match %sBetterComments "%s" containedin=%s', name, match_pattern_main, containedin_final))

  -- Define the line-specific match group
  local match_pattern_line = string.format([[\(\/{2\}\|#\{1\}\|\"\{1\}\) *\(\%%(%s\)\)...\+]], table.concat(rules, '\\|'))
  vim.cmd(string.format('syn match %sLineBetterComments "%s" containedin=%sLineComment', name, match_pattern_line, b_bettercomments_syntax_prefix))
end

local function better_comments()
  local language = vim.bo.filetype:match('([^.]+)') -- Equivalent to substitute(&filetype, '\..*', '', '')

  -- Skip check
  if vim.g.bettercomments_skipped and vim.tbl_contains(vim.g.bettercomments_skipped, language) then
    return
  end

  -- Included check
  if vim.g.bettercomments_included and not vim.tbl_contains(vim.g.bettercomments_included, language) then
    return
  end

  -- Set buffer-local syntax prefix
  vim.b.bettercomments_syntax_prefix = vim.g.bettercomments_language_aliases and vim.g.bettercomments_language_aliases[language] or language

  -- Call add_matches_group for each type
  add_matches_group("Highlight", { '+', 'WARN:' })
  add_matches_group("Error", { '!', 'ERROR:', 'DEPRECATED:' })
  add_matches_group("Question", { '?', 'QUESTION:' })
  add_matches_group("Todo", { 'TODO:', 'FIXME:' })

  -- StrikeoutBetterComments
  local containedin_strikeout = vim.tbl_map(function(val)
    return vim.b.bettercomments_syntax_prefix .. val
  end, {'LineComment', 'MultilineComment', 'DocComment', 'Comment'})
  local containedin_strikeout_final = table.concat(containedin_strikeout, ',') .. ',Comment'

  local match_pattern_strikethrough = [[\(\/\{4\}\|#\{2\}\|\"\{2\}\).\+]]
  vim.cmd(string.format('syn match StrikeoutBetterComments "%s" containedin=%s', match_pattern_strikethrough, containedin_strikeout_final))
end

-- Autocommands
-- Using `vim.api.nvim_create_autocmd` for Neovim's Lua API
local betterComments_augroup = vim.api.nvim_create_augroup('betterCommentsPluginAuto', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = betterComments_augroup,
  pattern = '*',
  callback = better_comments,
  desc = 'Apply better comments highlighting on file type detection'
})

-- Syntax Highlighting Links
-- These can be placed directly in init.lua or a separate file if preferred.
-- The `link` function ensures they are set.
local function setup_highlight_links()
  vim.cmd('hi def link ErrorBetterComments WarningMsg')
  vim.cmd('hi def link ErrorLineBetterComments ErrorBetterComments')
  vim.cmd('hi def link HighlightBetterComments Underlined')
  vim.cmd('hi def link HighlightLineBetterComments HighlightBetterComments')
  vim.cmd('hi def link QuestionBetterComments Identifier')
  vim.cmd('hi def link QuestionLineBetterComments QuestionBetterComments')
  vim.cmd('hi def link StrikeoutBetterComments WarningMsg')
  vim.cmd('hi def link TodoBetterComments Type')
  vim.cmd('hi def link TodoLineBetterComments TodoBetterComments')
end

-- Call the setup function when the module is loaded
setup_highlight_links()
