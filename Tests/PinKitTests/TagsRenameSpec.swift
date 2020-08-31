@testable import PinKit
import Nimble
import Quick
import Foundation

class TagsRenameSpec: QuickSpec {
    override func spec() {
        describe("posts add") {
            let tagsRename = TagsRename(
                result: "done"
            )

            it("has a result") {
                expect(tagsRename.result) == "done"
            }

            context("when parsed") {
                let data = Data(from: "tags/rename.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tagsRename = try! decoder.decode(TagsRename.self, from: data)

                it("has a result") {
                    expect(tagsRename.result) == "rename to null"
                }
            }
        }
    }
}
