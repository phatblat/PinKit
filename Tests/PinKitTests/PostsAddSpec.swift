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
        }
    }
}
