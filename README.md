# lazy-help.nvim
[![CI](https://github.com/phanen/lazy-help.nvim/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/phanen/lazy-help.nvim/actions/workflows/ci.yml)

Lazy.nvim while not lazy load your helpdocs.
```lua
{
  "phanen/lazy-help.nvim", ft = "lazy",
},
```

> Ensure appending docs' cache into rtp
```lua
vim.g.docs_path = vim.fs.joinpath(vim.fn.stdpath('cache'), 'where-ever-you-like')
vim.opt.rtp:append(vim.g.docs_path)
```
