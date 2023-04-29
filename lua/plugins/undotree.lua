local g = vim.g

g.undotree_dir = '~/.cache/nvim/undotree_dir'

g.undotree_WindowLayout = 3
g.undotree_ShortIndicators = 1
g.undotree_SplitWidth = 30



vim.cmd(
[[
if has("persistent_undo")
   let target_path = expand(undotree_dir)

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]]
)


