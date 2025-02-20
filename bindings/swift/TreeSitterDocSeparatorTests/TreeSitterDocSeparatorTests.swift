import XCTest
import SwiftTreeSitter
import TreeSitterDocSeparator

final class TreeSitterDocSeparatorTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_doc_separator())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading DocSeparator grammar")
    }
}
