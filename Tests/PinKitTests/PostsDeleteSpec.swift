@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsDeleteSpec: QuickSpec {
    override func spec() {
        describe("posts delete") {
            let postsDelete = PostsDelete(
                resultCode: "done"
            )

            it("has a result code") {
                expect(postsDelete.resultCode) == "done"
            }

            context("parsing") {
                let data = Data(from: "posts/delete.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let postsDelete = try! decoder.decode(PostsDelete.self, from: data)

                it("can be parsed from json") {
                    expect(postsDelete.resultCode) == "item not found"
                }
            }
        }
    }
}
