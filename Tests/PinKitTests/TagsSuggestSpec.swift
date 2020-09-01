@testable import PinKit
import Nimble
import Quick
import Foundation

class TagsSuggestSpec: QuickSpec {
    override func spec() {
        describe("tag suggestions") {
            context("when parsed") {
                let data = Data(from: "tags/suggest.json")
                let decoder = JSONDecoder()
                let tagSuggestions = try! decoder.decode(TagsSuggest.self, from: data)

                it("contains 3 popular tags") {
                    expect(tagSuggestions.popular.count) == 3
                }
                it("contains 10 recommended tags") {
                    expect(tagSuggestions.recommended.count) == 10
                }
            }
        }
    }
}
