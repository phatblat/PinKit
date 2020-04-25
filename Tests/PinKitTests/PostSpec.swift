@testable import PinKit
import Nimble
import Quick
import Foundation

class PostSpec: QuickSpec {
    override func spec() {
        describe("post") {
            let post = Post(
                description: "a post",
                extended: "extra",
                hash: "a0df",
                href: URL(string: "http://localhost")!,
                meta: "so meta",
                shared: true,
                tags: "you're it",
                time: Date.distantPast,
                toread: true
            )

            it("has a description") {
                expect(post.description) == "a post"
            }
            it("has an extended") {
                expect(post.extended) == "extra"
            }
            it("has a hash") {
                expect(post.hash) == "a0df"
            }
            it("has a description") {
                expect(post.href) == URL(string: "http://localhost")!
            }
            it("has a meta") {
                expect(post.meta) == "so meta"
            }
            it("is shared") {
                expect(post.shared) == true
            }
            it("has tags") {
                expect(post.tags) == "you're it"
            }
            it("has a time") {
                expect(post.time) == Date.distantPast
            }
            it("has a toread flag") {
                expect(post.toread) == true
            }
        }
    }
}
