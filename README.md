# lazy-help.nvim
[![CI](https://github.com/phanen/lazy-help.nvim/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/phanen/lazy-help.nvim/actions/workflows/ci.yml)

Lazy.nvim while not lazy load your helpdocs.
```lua
{ "phanen/lazy-help.nvim", ft = "lazy" }
```

Ensure appending docs' cache into rtp
```lua
vim.g.docs_path = vim.fs.joinpath(vim.fn.stdpath('cache'), 'where-ever-you-like')
vim.opt.rtp:append(vim.g.docs_path)
```

## notes

Pickers (e.g. `fzf-lua`) may support load all vimdoc entries (without loading plugins)
* This is achieved by walking all rtp: https://github.com/ibhagwan/fzf-lua/discussions/1296
* Pros: don't need one more rtp to cache your helpdocs, tags won't conflict.
* Cons: but it won't work when you typings `:h something` in your commandline.

## TODO
* [ ] perf: no need to append one more rtp, just reuse `lazy.nvim`'s rtp
* [ ] fix duplicated tags (e.g. `Mini.git` or `fugitive` both have `:Git` entry)
  * but i don't want bloating `rtp`...
