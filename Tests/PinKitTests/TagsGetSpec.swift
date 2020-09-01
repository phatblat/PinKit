@testable import PinKit
import Nimble
import Quick
import Foundation

class TagsGetSpec: QuickSpec {
    override func spec() {
        describe("tags") {
            let tagsGet = TagsGet(
                tags: ["foo": 1, "bar": 2]
            )

            it("has a foo tag") {
                expect(tagsGet.foo) == 1
            }
            it("has a foo tag") {
                expect(tagsGet.bar) == 2
            }

            context("when parsed") {
                let data = Data(from: "tags/get.json")
                let decoder = JSONDecoder()
                let tagsGet = try! decoder.decode(TagsGet.self, from: data)

                it("has an email tag") {
                    expect(tagsGet.Email) == 12
                }
                it("has an applescript tag") {
                    expect(tagsGet.applescript) == 8
                }
                it("has no blah tag") {
                    expect(tagsGet.blah).to(beNil())
                }
            }
        }
    }
}
