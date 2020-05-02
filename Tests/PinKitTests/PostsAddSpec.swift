@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsAddSpec: QuickSpec {
    override func spec() {
        describe("posts add") {
            let postsAdd = PostsAdd(
                resultCode: "done"
            )

            it("has a result code") {
                expect(postsAdd.resultCode) == "done"
            }

            context("parsing") {
                let data = Data(from: "posts/add.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let postsAdd = try! decoder.decode(PostsAdd.self, from: data)

                it("can be parsed from json") {
                    expect(postsAdd.resultCode) == "done"
                }
            }
        }
    }
}
