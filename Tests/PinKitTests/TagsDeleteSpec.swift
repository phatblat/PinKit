@testable import PinKit
import Nimble
import Quick
import Foundation

class TagsDeleteSpec: QuickSpec {
    override func spec() {
        describe("posts add") {
            let tagsDelete = TagsDelete(
                result: "done"
            )

            it("has a result") {
                expect(tagsDelete.result) == "done"
            }

            context("when parsed") {
                let data = Data(from: "tags/delete.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tagsDelete = try! decoder.decode(TagsDelete.self, from: data)

                it("has a result") {
                    expect(tagsDelete.result) == "done"
                }
            }
        }
    }
}
