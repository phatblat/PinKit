@testable import PinKit
import Nimble
import Quick
import Foundation

class PostSpec: QuickSpec {
    override func spec() {
        describe("post") {
            let dateFormatter = ISO8601DateFormatter()
            // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
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
            
            context("when parsed") {
                let data = Data(from: "posts/single.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let post = try! decoder.decode(Post.self, from: data)

                it("can be parsed from json") {
                    expect(post.time) == dateFormatter.date(from: "2019-02-17T05:54:24Z")!
                }
            }
        }
    }
}
