/**
 * @file A parser for separators in Markdown
 * @author Dmitry Khrykin <khrykin@me.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "doc_separator",

  rules: {
    document: ($) => repeat($._content),

    _content: ($) => choice($.separator, $.section),

    separator: () => /──*\n/,

    section: () => /[^─]+/,
  },
});
