package tree_sitter_doc_separator_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_doc_separator "github.com/tree-sitter/tree-sitter-doc_separator/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_doc_separator.Language())
	if language == nil {
		t.Errorf("Error loading DocSeparator grammar")
	}
}
