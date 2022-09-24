local colors = require("gravel_pit.colors")
local styles = require("gravel_pit.styles")

local theme = {}

theme.loadSyntax = function(style)
	-- Syntax highlight groups

	local syntax = {
		Type = { fg = colors[style].bright_red }, -- int, long, char, etc.
		StorageClass = { fg = colors[style].cyan }, -- static, register, volatile, etc.
		Structure = { fg = colors[style].bright_yellow }, -- struct, union, enum, etc.
		Comment = { fg = colors[style].comments, style = styles.comments }, -- italic comments
		SpecialComment = { fg = colors[style].comments, style = styles.comments }, -- special things inside a comment
		Conditional = { fg = colors[style].bright_red, style = styles.keywords }, -- italic if, then, else, endif, switch, etc.
		Constant = { fg = colors[style].yellow }, -- any constant
		Character = { fg = colors[style].orange }, -- any character constant: 'c', '\n'
		Number = { fg = colors[style].bright_yellow }, -- a number constant: 5
		Boolean = { fg = colors[style].yellow }, -- a boolean constant: TRUE, false
		Float = { fg = colors[style].yellow }, -- a floating point constant: 2.3e10
		Function = { fg = colors[style].blue, style = styles.functions }, -- italic funtion names
		Identifier = { fg = colors[style].fg, style = styles.variables }, -- any variable name
		Statement = { fg = colors[style].bright_yellow }, -- any statement
		Keyword = { fg = colors[style].bright_red, style = styles.keywords }, -- italic for, do, while, etc.
		Label = { fg = colors[style].bright_red }, -- case, default, etc.
		Operator = { fg = colors[style].cyan }, -- sizeof", "+", "*", etc.
		Exception = { fg = colors[style].bright_red }, -- try, catch, throw
		PreProc = { fg = colors[style].bright_red }, -- generic Preprocessor
		Include = { fg = colors[style].bright_red }, -- preprocessor #include
		Define = { fg = colors[style].bright_red }, -- preprocessor #define
		Macro = { fg = colors[style].bright_red }, -- same as Define
		Typedef = { fg = colors[style].bright_red }, -- A typedef
		PreCondit = { fg = colors[style].bright_red }, -- preprocessor #if, #else, #endif, etc.
		Repeat = { fg = colors[style].bright_red, style = styles.keywords }, -- italic any other keyword
		String = { fg = colors[style].cyan, style = styles.strings }, -- any string
		Special = { fg = colors[style].bright_red }, -- any special symbol
		SpecialChar = { fg = colors[style].disabled }, -- special character in a constant
		Tag = { fg = colors[style].bright_red }, -- you can use CTRL-] on this
		Delimiter = { fg = colors[style].cyan }, -- character that needs attention like , or .
		Debug = { fg = colors[style].bright_red }, -- debugging statements
		Underlined = { fg = colors[style].link, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = colors[style].disabled }, -- left blank, hidden
		Error = { fg = colors[style].error, style = "bold,underline" }, -- any erroneous construct
		Todo = { fg = colors[style].cyan, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO HACK FIXME and XXX

		htmlLink = { fg = colors[style].link, style = "underline" },
		htmlH1 = { fg = colors[style].cyan, style = "bold" },
		htmlH2 = { fg = colors[style].bright_red, style = "bold" },
		htmlH3 = { fg = colors[style].green, style = "bold" },
		htmlH4 = { fg = colors[style].yellow, style = "bold" },
		htmlH5 = { fg = colors[style].magenta, style = "bold" },
		markdownH1 = { fg = colors[style].bright_yellow, style = "bold" },
		markdownH2 = { fg = colors[style].bright_yellow, style = "bold" },
		markdownH3 = { fg = colors[style].bright_yellow, style = "bold" },
		markdownH1Delimiter = { fg = colors[style].bright_yellow },
		markdownH2Delimiter = { fg = colors[style].bright_yellow },
		markdownH3Delimiter = { fg = colors[style].bright_yellow },
		markdownCode = { fg = colors[style].bright_magenta },
		markdownCodeDelimiter = { fg = colors[style].magenta },
		markdownListMarker = { fg = colors[style].bright_red },
		markdownLinkText = { fg = colors[style].bright_yellow },
		markdownLink = { fg = colors[style].blue },
		markdownUrl = { fg = colors[style].blue },
	}

	return syntax
end

theme.loadEditor = function(style)
	-- Editor highlight groups

	local editor = {
		Normal = { fg = colors[style].fg, bg = colors[style].bg }, -- normal text and background color
		NormalNC = { fg = colors[style].fg, bg = colors[style].bg }, -- normal text and background color
		NormalFloat = { fg = colors[style].fg, bg = colors[style].float }, -- normal text and background color for floating windows
		NormalContrast = { fg = colors[style].fg, bg = colors[style].red }, -- a help group for contrast fileypes
		FloatBorder = { fg = colors[style].yellow, bg = colors[style].float }, -- floating window border
		ColorColumn = { fg = colors[style].green, bg = colors[style].float }, --  used for the columns set with 'colorcolumn'
		VertSplit = { fg = colors[style].comments }, -- The column separating vertically split windows
		WinSeparator = { fg = colors[style].comments }, -- Lines between window splits
		Conceal = { fg = colors[style].disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = colors[style].bg_alt, bg = colors[style].cursor }, -- the character under the cursor
		CursorIM = { fg = colors[style].bg_alt, bg = colors[style].cursor }, -- like Cursor, but used when in IME mode
		Directory = { fg = colors[style].blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = colors[style].diff_add }, -- diff mode: Added line
		DiffChange = { bg = colors[style].diff_mod }, --  diff mode: Changed line
		DiffDelete = { bg = colors[style].diff_del }, -- diff mode: Deleted line
		DiffText = { fg = colors[style].fg }, -- diff mode: Changed text within a changed line
		ErrorMsg = { fg = colors[style].error }, -- error messages
		Folded = { fg = colors[style].comments, style = "italic" }, -- line used for closed folds
		FoldColumn = { fg = colors[style].blue }, -- 'foldcolumn'
		IncSearch = { fg = colors[style].title, bg = colors[style].selection, style = "underline" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr = { fg = colors[style].line_numbers, bg = colors[style].bg_num }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = colors[style].bright_yellow, bg = colors[style].bg_num }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { fg = colors[style].yellow, style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = colors[style].accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg = { fg = colors[style].accent }, -- |more-prompt|
		NonText = { fg = colors[style].disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Question = { fg = colors[style].green }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { fg = colors[style].highlight, bg = colors[style].title, style = "reverse" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr = { fg = colors[style].highlight, bg = colors[style].title, style = "reverse" }, -- Line numbers for quickfix lists
		Search = { fg = colors[style].bg, bg = colors[style].cyan, style = "bold" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SignColumn = { fg = colors[style].fg, bg = colors[style].bg_sign },
		SpecialKey = { fg = colors[style].magenta }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { fg = colors[style].red, style = "italic,undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { fg = colors[style].blue, style = "italic,undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { fg = colors[style].cyan, style = "italic,undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { fg = colors[style].magenta, style = "italic,undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = colors[style].fg, bg = colors[style].bg }, -- status line of current window
		StatusLineNC = { fg = colors[style].disabled, bg = colors[style].bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm = { fg = colors[style].fg, bg = colors[style].active }, -- status line of current terminal window
		StatusLineTermNC = { fg = colors[style].disabled, bg = colors[style].bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill = { fg = colors[style].fg, bg = colors[style].float }, -- tab pages line, where there are no labels
		TablineSel = { fg = colors[style].cyan, bg = colors[style].float }, -- tab pages line, active tab page label
		Tabline = { fg = colors[style].cyan, bg = colors[style].float },
		Title = { fg = colors[style].title, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { fg = colors[style].none, bg = colors[style].selection }, -- Visual mode selection
		VisualNOS = { fg = colors[style].none, bg = colors[style].selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = colors[style].yellow }, -- warning messages
		Whitespace = { fg = colors[style].disabled }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { fg = colors[style].orange, style = "bold" }, -- current match in 'wildmenu' completion
		CursorColumn = { fg = colors[style].none, bg = colors[style].bg_cur }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { fg = colors[style].none, bg = colors[style].black }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		-- ToolbarLine =			{ fg = colors[style].fg, bg = colors[style].bg_alt },
		-- ToolbarButton =			{ fg = colors[style].fg, style = 'bold' },
		NormalMode = { fg = colors[style].comments }, -- Normal mode message in the cmdline
		InsertMode = { fg = colors[style].green }, -- Insert mode message in the cmdline
		ReplacelMode = { fg = colors[style].red }, -- Replace mode message in the cmdline
		VisualMode = { fg = colors[style].magenta }, -- Visual mode message in the cmdline
		CommandMode = { fg = colors[style].gray }, -- Command mode message in the cmdline
		Warnings = { fg = colors[style].yellow },

		healthError = { fg = colors[style].error },
		healthSuccess = { fg = colors[style].green },
		healthWarning = { fg = colors[style].yellow },

		-- Dashboard
		DashboardShortCut = { fg = colors[style].red },
		DashboardHeader = { fg = colors[style].comments },
		DashboardCenter = { fg = colors[style].accent },
		DashboardFooter = { fg = colors[style].green, style = "italic" },

		-- Command line parameter menue
		Pmenu = { fg = colors[style].fg, bg = colors[style].float },
		PmenuSel = { fg = colors[style].bg, bg = colors[style].yellow }, -- Popup menu: selected item.
	}

	-- Options:

	return editor
end

theme.loadTerminal = function(style)
	vim.g.terminal_color_0 = colors[style].black
	vim.g.terminal_color_1 = colors[style].red
	vim.g.terminal_color_2 = colors[style].green
	vim.g.terminal_color_3 = colors[style].yellow
	vim.g.terminal_color_4 = colors[style].blue
	vim.g.terminal_color_5 = colors[style].magenta
	vim.g.terminal_color_6 = colors[style].cyan
	vim.g.terminal_color_7 = colors[style].white
	vim.g.terminal_color_8 = colors[style].disabled
	vim.g.terminal_color_9 = colors[style].bright_red
	vim.g.terminal_color_10 = colors[style].bright_green
	vim.g.terminal_color_11 = colors[style].bright_yellow
	vim.g.terminal_color_12 = colors[style].bright_blue
	vim.g.terminal_color_13 = colors[style].bright_magenta
	vim.g.terminal_color_14 = colors[style].bright_cyan
	vim.g.terminal_color_15 = colors[style].white
end

theme.loadTreeSitter = function(style)
	-- TreeSitter highlight groups

	local treesitter = {
		TSAttribute = { fg = colors[style].yellow }, -- (unstable) TODO: docs
		TSBoolean = { fg = colors[style].orange }, -- For booleans.
		TSCharacter = { fg = colors[style].orange }, -- For characters.
		TSComment = { fg = colors[style].comments, style = styles.comments }, -- For comment blocks.
		TSConditional = { fg = colors[style].bright_red, style = styles.keywords }, -- For keywords related to conditionnals.
		TSConstructor = { fg = colors[style].blue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = colors[style].bright_yellow }, -- For constants
		TSConstBuiltin = { fg = colors[style].bright_red }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = colors[style].bright_red }, -- For constants that are defined by macros: `NULL` in C.
		TSError = { fg = colors[style].error }, -- For syntax/parser errors.
		TSException = { fg = colors[style].bright_red }, -- For exception related keywords.
		TSField = { fg = colors[style].bright_green }, -- For fields.
		TSFloat = { fg = colors[style].orange }, -- For floats.
		TSFunction = { fg = colors[style].blue, style = styles.functions }, -- For fuction (calls and definitions).
		TSFuncBuiltin = { fg = colors[style].blue, style = styles.functions }, -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro = { fg = colors[style].bright_red }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = colors[style].bright_red }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = { fg = colors[style].bright_yellow, style = styles.keywords }, -- For keywords that don't fall in previous categories.
		TSKeywordFunction = { fg = colors[style].bright_red, style = styles.keywords }, -- For keywords used to define a fuction.
		TSKeywordOperator = { fg = colors[style].brigth_red }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		TSKeywordReturn = { fg = colors[style].bright_red }, -- return keyword
		TSLabel = { fg = colors[style].bright_red }, -- For labels: `label:` in C and `:label:` in Lua.
		TSMethod = { fg = colors[style].bright_blue, style = styles.functions }, -- For method calls and definitions.
		TSNamespace = { fg = colors[style].bright_yellow }, -- For identifiers referring to modules and namespaces.
		TSNumber = { fg = colors[style].bright_red }, -- For all numbers
		TSOperator = { fg = colors[style].bright_yellow }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = colors[style].yellow }, -- For parameters of a function.
		TSParameterReference = { fg = colors[style].yellow }, -- For references to parameters of a function.
		TSProperty = { fg = colors[style].bright_green }, -- Same as `TSField`,accesing for struct members in C.
		TSPunctDelimiter = { fg = colors[style].bright_yellow }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = colors[style].fg }, -- For brackets and parens.
		TSPunctSpecial = { fg = colors[style].fg }, -- For special punctutation that does not fall in the catagories before.
		TSRepeat = { fg = colors[style].bright_red, style = styles.keywords }, -- For keywords related to loops.
		TSString = { fg = colors[style].cyan, styles = styles.strings }, -- For strings.
		TSStringRegex = { fg = colors[style].yellow }, -- For regexes.
		TSStringEscape = { fg = colors[style].text }, -- For escape characters within a string.
		TSSymbol = { fg = colors[style].yellow }, -- For identifiers referring to symbols or atoms.
		TSStrong = { fg = colors[style].magenta, style = "bold" }, -- Text to be represented in bold.
		TSType = { fg = colors[style].green }, -- For types.
		TSTypeBuiltin = { fg = colors[style].green }, -- For builtin types.
		TSTag = { fg = colors[style].bright_red }, -- Tags like html tag names.
		TSTagDelimiter = { fg = colors[style].cyan }, -- Tag delimiter like `<` `>` `/`
		TSTagAttribute = { fg = colors[style].gray }, -- HTML tag attributes.
		TSText = { fg = colors[style].fg }, -- For strings considered text in a markup language.
		TSTextReference = { fg = colors[style].yellow }, -- FIXME
		TSVariable = { fg = colors[style].fg, style = styles.variables }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = colors[style].fg, style = styles.variables }, -- Variable names that are defined by the languages, like `this` or `self`.
		TSEmphasis = { fg = colors[style].bright_blue }, -- For text to be represented with emphasis.
		TSUnderline = { fg = colors[style].fg, style = "underline" }, -- For text to be represented with an underline.
		-- TSStrike =                  { fg = colors[style].fg,, style = 'strikethrough'}, -- For strikethrough text.
		TSTitle = { fg = colors[style].title, style = "bold" }, -- Text that is part of a title.
		TSLiteral = { fg = colors[style].fg }, -- Literal text.
		TSURI = { fg = colors[style].link }, -- Any URI like a link or email.
		TSMath = { fg = colors[style].blue }, -- Math environments like LaTeX's `$ ... $`
		TSDanger = { fg = colors[style].error }, -- Text representation of a danger note.
		htmlTSTag = { fg = colors[style].bright_red },
		htmlTSTagAttribute = { fg = colors[style].yellow },
		htmlTSText = { fg = colors[style].white },

		-- TSX
		tsxTag = { fg = colors[style].bright_yellow },
		tsxCloseTag = { fg = colors[style].bright_yellow },
		tsxCloseString = { fg = colors[style].bright_yellow },
		tsxTagName = { fg = colors[style].green },
		tsxAttrib = { fg = colors[style].yellow },
		tsxFragment = { fg = colors[style].green },
		tsxIntrinsicTagName = { fg = colors[style].bright_red },
		typescriptVariable = { fg = colors[style].bright_red },
		typescriptTypeReference = { fg = colors[style].green },
		typescriptStatementKeyword = { fg = colors[style].bright_red },

		-- XML
		xmlTag = { fg = colors[style].bright_yellow },
		xmlEndTag = { fg = colors[style].bright_red },
		xmlTagName = { fg = colors[style].bright_red },
		xmlAttrib = { fg = colors[style].yellow },
	}

	return treesitter
end

theme.loadLSP = function(style)
	-- Lsp highlight groups

	local lsp = {
		DiagnosticError = { fg = colors[style].error },
		DiagnosticWarn = { fg = colors[style].yellow },
		DiagnosticInformation = { fg = colors[style].bright_blue },
		DiagnosticHint = { fg = colors[style].magenta },
		DiagnosticSignError = { fg = colors[style].error, bg = colors[style].bg },
		DiagnosticSignWarn = { fg = colors[style].yellow, bg = colors[style].bg },
		DiagnosticSignInfo = { fg = colors[style].bright_blue, bg = colors[style].bg },
		DiagnosticSignHint = { fg = colors[style].magenta, bg = colors[style].bg },
		DiagnosticUnderlineError = { style = "undercurl", sp = colors[style].error },
		DiagnosticUnderlineWarn = { style = "undercurl", sp = colors[style].yellow },
		DiagnosticUnderlineInfo = { style = "undercurl", sp = colors[style].bright_blue },
		DiagnosticUnderlineHint = { style = "undercurl", sp = colors[style].magenta },
		DiagnosticFloatingError = { fg = colors[style].error },
		DiagnosticFloatingWarn = { fg = colors[style].yellow },
		DiagnosticFloatingInfo = { fg = colors[style].bright_blue },
		DiagnosticFloatingHint = { fg = colors[style].magenta },
		DiagnosticVirtualTextError = { fg = colors[style].error },
		DiagnosticVirtualTextWarn = { fg = colors[style].yellow },
		DiagnosticVirtualTextInfo = { fg = colors[style].bright_blue },
		DiagnosticVirtualTextHint = { fg = colors[style].magenta },
		LspReferenceText = { bg = colors[style].selection, style = "underline" }, -- used for highlighting "text" references
		LspReferenceRead = { bg = colors[style].selection, style = "underline" }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = colors[style].selection, style = "underline" }, -- used for highlighting "write" references
		LspDiagnosticsError = { fg = colors[style].error },
		LspDiagnosticsWarning = { fg = colors[style].yellow },
		LspDiagnosticsInformation = { fg = colors[style].bright_blue },
		LspDiagnosticsHint = { fg = colors[style].magenta },
	}

	return lsp
end

theme.loadPlugins = function(style)
	-- Plugins highlight groups
	local plugins = {

		-- Built in debugger
		-- debugPC =								{ bg = material.selection },
		debugBreakpoint = { fg = colors[style].error, bg = colors[style].bg },

		-- Trouble
		TroubleText = { fg = colors[style].text, bg = colors[style].sidebar },
		TroubleCount = { fg = colors[style].magenta, bg = colors[style].sidebar },
		TroubleNormal = { fg = colors[style].fg, bg = colors[style].sidebar },
		TroubleSignError = { fg = colors[style].error, bg = colors[style].sidebar },
		TroubleSignWarning = { fg = colors[style].yellow, bg = colors[style].sidebar },
		TroubleSignInformation = { fg = colors[style].bright_blue, bg = colors[style].sidebar },
		TroubleSignHint = { fg = colors[style].magenta, bg = colors[style].sidebar },
		TroubleFoldIcon = { fg = colors[style].accent, bg = colors[style].sidebar },
		TroubleIndent = { fg = colors[style].border, bg = colors[style].sidebar },
		TroubleLocation = { fg = colors[style].disabled, bg = colors[style].sidebar },

		-- Nvim-Cmp
		CmpItemAbbrMatch = { fg = colors[style].bright_blue, style = "bold" },
		CmpItemKindText = { fg = colors[style].red },
		CmpItemKindMethod = { fg = colors[style].blue },
		CmpItemKindFunction = { fg = colors[style].blue },
		CmpItemKindContructor = { fg = colors[style].magenta },
		CmpItemKindField = { fg = colors[style].cyan },
		CmpItemKindVariable = { fg = colors[style].bright_blue },
		CmpItemKindConstant = { fg = colors[style].bright_blue },
		CmpItemKindClass = { fg = colors[style].yellow },
		CmpItemKindInterface = { fg = colors[style].yellow },
		CmpItemKindModule = { fg = colors[style].red },
		CmpItemKindProperty = { fg = colors[style].magenta },
		CmpItemKindKeyword = { fg = colors[style].cyan },
		CmpItemKindFile = { fg = colors[style].title },
		CmpItemKindFolder = { fg = colors[style].title },
		CmpItemKindSnippet = { fg = colors[style].green },

		-- Diff
		diffAdded = { fg = colors[style].green },
		diffRemoved = { fg = colors[style].bright_reed },
		diffChanged = { fg = colors[style].blue },
		diffOldFile = { fg = colors[style].text },
		diffNewFile = { fg = colors[style].title },
		diffFile = { fg = colors[style].gray },
		diffLine = { fg = colors[style].cyan },
		diffIndexLine = { fg = colors[style].magenta },

		-- Neogit
		NeogitBranch = { fg = colors[style].cyan },
		NeogitRemote = { fg = colors[style].magenta },
		NeogitHunkHeader = { fg = colors[style].fg, bg = colors[style].highlight },
		NeogitHunkHeaderHighlight = { fg = colors[style].blue, bg = colors[style].contrast },
		NeogitDiffContextHighlight = { fg = colors[style].text, bg = colors[style].contrast },
		NeogitDiffDeleteHighlight = { fg = colors[style].bright_red },
		NeogitDiffAddHighlight = { fg = colors[style].green },

		-- Git blame
		Gitblame = { fg = colors[style].comments, bg = colors[style].black },

		-- GitGutter
		GitGutterAdd = { fg = colors[style].green }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = colors[style].blue }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = colors[style].bright_red }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = colors[style].green, bg = colors[style].bg_sign }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = colors[style].green, bg = colors[style].bg_num }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = colors[style].green }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = colors[style].blue, bg = colors[style].bg_sign }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = colors[style].blue, bg = colors[style].bg_num }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = colors[style].blue }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = colors[style].bright_red, bg = colors[style].bg_sign }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = colors[style].bright_red, bg = colors[style].bg_num }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = colors[style].bright_red }, -- diff mode: Deleted line |diff.txt|
		GitSignsCurrentLineBlame = { fg = colors[style].comments },

		-- Telescope
		TelescopeNormal = { fg = colors[style].fg, bg = colors[style].float },
		TelescopePromptBorder = { fg = colors[style].border, bg = colors[style].float },
		TelescopeResultsBorder = { fg = colors[style].border, bg = colors[style].float },
		TelescopePreviewBorder = { fg = colors[style].border, bg = colors[style].float },
		TelescopeSelectionCaret = { fg = colors[style].magenta },
		TelescopeSelection = { fg = colors[style].bg, bg = colors[style].cyan },
		TelescopeMatching = { fg = colors[style].yellow },

		-- NvimTree
		NvimTreeNormal = { fg = colors[style].fg, bg = colors[style].sidebar },
		NvimTreeNormalNC = { fg = colors[style].fg, bg = colors[style].sidebar },
		NvimTreeRootFolder = { fg = colors[style].accent, bg = colors[style].sidebar },
		NvimTreeFolderName = { fg = colors[style].cyan, style = "bold" },
		NvimTreeFolderIcon = { fg = colors[style].cyan, style = "bold" },
		NvimTreeEmptyFolderName = { fg = colors[style].gray },
		NvimTreeOpenedFolderName = { fg = colors[style].bright_cyan, style = "bold" },
		NvimTreeIndentMarker = { fg = colors[style].disabled },
		NvimTreeGitDirty = { fg = colors[style].blue },
		NvimTreeGitNew = { fg = colors[style].bright_green },
		NvimTreeGitStaged = { fg = colors[style].fg },
		NvimTreeGitDeleted = { fg = colors[style].red },
		NvimTreeOpenedFile = { fg = colors[style].cyan },
		NvimTreeImageFile = { fg = colors[style].yellow },
		NvimTreeMarkdownFile = { fg = colors[style].pink },
		NvimTreeExecFile = { fg = colors[style].green },
		NvimTreeSpecialFile = { fg = colors[style].magenta },

		-- Sidebar.nvim
		SidebarNvimNormal = { fg = colors[style].fg },
		SidebarNvimSectionTitle = { fg = colors[style].accent },
		SidebarNvimSectionSeparator = { fg = colors[style].border },
		SidebarNvimLabel = { fg = colors[style].gray },

		-- WhichKey
		WhichKey = { fg = colors[style].accent, style = "bold" },
		WhichKeyGroup = { fg = colors[style].gray },
		WhichKeyDesc = { fg = colors[style].fg, style = "italic" },
		WhichKeySeparator = { fg = colors[style].red },
		WhichKeyFloat = { bg = colors[style].float },

		-- LspSaga
		LspFloatWinNormal = { fg = colors[style].fg, bg = colors[style].float },
		LspFloatWinBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaDiagnosticBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaDiagnosticHeader = { fg = colors[style].blue },
		LspSagaDiagnosticTruncateLine = { fg = colors[style].border },
		LspLinesDiagBorder = { fg = colors[style].border, bg = colors[style].float },
		ProviderTruncateLine = { fg = colors[style].border },
		LspSagaShTruncateLine = { fg = colors[style].border },
		LspSagaDocTruncateLine = { fg = colors[style].border },
		LineDiagTruncateLine = { fg = colors[style].border },
		LspSagaBorderTitle = { fg = colors[style].cyan, bg = colors[style].float },
		LspSagaHoverBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaRenameBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaRenamePromptPrefix = { fg = colors[style].green },
		LspSagaDefPreviewBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaCodeActionTitle = { fg = colors[style].bright_blue },
		LspSagaCodeActionContent = { fg = colors[style].magenta },
		LspSagaCodeActionBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaCodeActionTruncateLine = { fg = colors[style].border },
		LspSagaSignatureHelpBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaFinderSelection = { fg = colors[style].green },
		LspSagaLspFinderBorder = { fg = colors[style].border, bg = colors[style].float },
		LspSagaAutoPreview = { fg = colors[style].border, bg = colors[style].float },
		ReferencesCount = { fg = colors[style].magenta },
		DefinitionCount = { fg = colors[style].magenta },
		DefinitionPreviewTitle = { fg = colors[style].green },
		DefinitionIcon = { fg = colors[style].blue },
		ReferencesIcon = { fg = colors[style].blue },
		TargetWord = { fg = colors[style].cyan },

		-- Symbols outline
		FocusedSymbol = { bg = colors[style].selection },
		SymbolsOutlineConnector = { fg = colors[style].border },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = colors[style].bright_cyan },
		BufferLineFill = { bg = colors[style].bg },

		-- Sneak
		Sneak = { fg = colors[style].bg, bg = colors[style].accent },
		SneakScope = { bg = colors[style].selection },

		-- Indent Blankline
		IndentBlanklineChar = { fg = colors[style].comments },
		IndentBlanklineContextChar = { fg = colors[style].bright_yellow },

		-- Nvim dap
		DapBreakpoint = { fg = colors[style].error },
		DapStopped = { fg = colors[style].yellow },

		-- Nvim dap-UI
		DapUIFloatBorder = { fg = colors[style].border, bg = colors[style].bg },
		DapUIDecoration = { fg = colors[style].blue },
		-- DapUIVariable = 						{ fg = colors[style].fg },

		-- Illuminate
		illuminatedWord = { bg = colors[style].highight, gui = "italic" },
		illuminatedCurWord = { bg = colors[style].highight, gui = "underline" },

		-- Hop
		HopNextKey = { fg = colors[style].accent, style = "bold" },
		HopNextKey1 = { fg = colors[style].magenta, style = "bold" },
		HopNextKey2 = { fg = colors[style].blue },
		HopUnmatched = { fg = colors[style].comments },

		-- Fern
		FernBranchText = { fg = colors[style].blue },
	}

	return plugins
end

return theme
