vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyHelp', { clear = true }),
  pattern = { 'LazyInstall*', 'LazyUpdate*', 'LazySync*', 'LazyRestore*' },
  callback = function()
    local lazy_util = package.loaded['lazy.util']
    local lazy_config = package.loaded['lazy.core.config']
    local docs_root = vim.fs.joinpath(vim.fs.dirname(lazy_config.options.readme))
    local docs_path = vim.fs.joinpath(docs_root, 'doc')
    vim.fn.mkdir(docs_path, 'p')
    lazy_util.ls(docs_path, function(path, _, _)
      if type == 'file' then
        vim.uv.fs_unlink(path)
      end
    end)
    for _, plugin in pairs(lazy_config.plugins) do
      vim.print(plugin.dir)
      local docs = vim.fs.joinpath(plugin.dir, 'doc')
      if lazy_util.file_exists(docs) then
        lazy_util.ls(docs, function(path, name, type)
          if type ~= 'file' then
            return
          end
          if name == 'tags' then
            vim.uv.fs_unlink(path)
          elseif name:sub(-4) == '.txt' then
            vim.uv.fs_copyfile(path, vim.fs.joinpath(docs_path, name))
          end
        end)
      end
    end
    vim.cmd.helptags(docs_path)
  end,
})
