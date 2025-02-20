# doc_separator

A Tree-sitter parser for Neovim's LSP hover windows that allows to define a highlight group for the separator line output by some LSP servers. The separator line uses the `─` character which doesn't have a special meaning in Markdown and thus can't have its own highlighting group. This parser allows to style these separator lines.


## Setup

```lua
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.doc_separator = {
  install_info = {
    url = "https://github.com/khrykin/tree-sitter-doc_separator",
    files = { "src/parser.c" },
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
}
```

Save to `nvim/after/queries/doc_separator/injections.scm`:
```query
;; extends

((section) @injection.content
  (#set! injection.language "markdown"))
```

Save to `nvim/after/queries/doc_separator/highlights.scm`:
```query
;; extends

((separator) @separator)
```
And finally, to `nvim/after/queries/markdown/injections.scm`:

```query
;; extends

((inline) @injection.content
  (#match? @injection.content "──*")
  (#set! injection.language "doc_separator"))
```

Run:
```
:TSInstall doc_separator
```

Now you can set the highlight for `@separator`.

An example of how it can look like:

<img width="1840" alt="Screenshot 2025-02-20 at 17 56 40" src="https://github.com/user-attachments/assets/0378f2e5-14f7-4e38-baec-1f9dbaf3d9ed" />

