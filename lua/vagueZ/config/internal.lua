local M = {}

---@class VagueColorscheme.InternalConfig
local DEFAULT_SETTINGS = {

  ---@type boolean
  transparent = false,
  ---@class VagueColorscheme.InternalConfig.style
  style = {
    ---@type string
    boolean = "bold",
    ---@type string
    number = "none",
    ---@type string
    float = "none",
    ---@type string
    error = "bold",
    ---@type string
    comments = "italic",
    ---@type string
    conditionals = "none",
    ---@type string
    functions = "none",
    ---@type string
    headings = "bold",
    ---@type string
    operators = "none",
    ---@type string
    strings = "italic",
    ---@type string
    variables = "none",

    ---@type string
    keywords = "none",
    ---@type string
    keyword_return = "italic",
    ---@type string
    keywords_loop = "none",
    ---@type string
    keywords_label = "none",
    ---@type string
    keywords_exception = "none",

    builtin_constants = "bold",
    ---@type string
    builtin_functions = "none",
    ---@type string
    builtin_types = "bold",
    ---@type string
    builtin_variables = "none",
  },

  ---@param highlights table<string, vim.api.keyset.highlight>
  ---@param colors VagueColorscheme.InternalConfig.colors
  on_highlights = function(highlights, colors) end,

  ---@class VagueColorscheme.InternalConfig.plugins
  plugins = {
    ---@class VagueColorscheme.InternalConfig.plugins.cmp
    cmp = {
      ---@type string
      match = "bold",
      ---@type string
      match_fuzzy = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.dashboard
    dashboard = {
      ---@type string
      footer = "italic",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.lsp
    lsp = {
      ---@type string
      diagnostic_error = "bold",
      ---@type string
      diagnostic_hint = "none",
      ---@type string
      diagnostic_info = "italic",
      ---@type string
      diagnostic_warn = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.neotest
    neotest = {
      ---@type string
      focused = "bold",
      ---@type string
      adapter_name = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.telescope
    telescope = {
      ---@type string
      match = "bold",
    },
  },
  ---@class VagueColorscheme.InternalConfig.colors
  colors = {
    ---@type string
    bg = "#141415", -- unchanged
    ---@type string
    fg = "#e1e1e1", -- from #cdcdcd
    ---@type string
    floatBorder = "#9c9c9c", -- from #878787
    ---@type string
    line = "#252530", -- unchanged
    ---@type string
    comment = "#6d6d8a", -- from #606079
    ---@type string
    builtin = "#c4e2dd", -- from #b4d4cf
    ---@type string
    func = "#d29494", -- from #c48282
    ---@type string
    string = "#f8c79b", -- from #e8b589
    ---@type string
    number = "#f0b575", -- from #e0a363
    ---@type string
    property = "#d4d4e7", -- from #c3c3d5
    ---@type string
    constant = "#bfbfe2", -- from #aeaed1
    ---@type string
    parameter = "#cbaed0", -- from #bb9dbd
    ---@type string
    visual = "#333738", -- unchanged
    ---@type string
    error = "#e7758e", -- from #d8647e
    ---@type string
    warning = "#fbd892", -- from #f3be7c
    ---@type string
    hint = "#90aaff", -- from #7e98e8
    ---@type string
    operator = "#a3b3c9", -- from #90a0b5
    ---@type string
    keyword = "#7fa5c5", -- from #6e94b2
    ---@type string
    type = "#adc5ce", -- from #9bb4bc
    ---@type string
    search = "#405065", -- unchanged
    ---@type string
    plus = "#92b976", -- from #7fa563
    ---@type string
    delta = "#fbd892", -- from #f3be7c
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.vagueZ_colorscheme) == "function" and vim.g.vagueZ_colorscheme()
  or vim.g.vagueZ_colorscheme
  or {}

---@param user_opts VagueColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
