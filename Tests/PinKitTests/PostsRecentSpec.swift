@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsRecentSpec: QuickSpec {
    override func spec() {
        describe("recent posts") {
            let dateFormatter = ISO8601DateFormatter()
            // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let postsRecent = PostsRecent(
                date: dateFormatter.date(from: "2019-02-18T21:24:00Z")!,
                user: "phatblat",
                posts: []
            )

            it("has a date") {
                expect(postsRecent.date) == dateFormatter.date(from: "2019-02-18T21:24:00Z")!
            }

            context("when parsed") {
                let data = Data(from: "posts/recent.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let postsRecent = try! decoder.decode(PostsRecent.self, from: data)

                it("has a date") {
                    expect(postsRecent.date) == dateFormatter.date(from: "2019-02-18T21:24:00Z")!
                }
                it("has a user") {
                    expect(postsRecent.user) == "phatblat"
                }
                it("has some posts") {
                    expect(postsRecent.posts.count) == 15
                }
            }
        }
    }
}
