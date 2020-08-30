@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsUpdateSpec: QuickSpec {
    override func spec() {
        describe("posts update") {
            let dateFormatter = ISO8601DateFormatter()
            // dateFormatter.locale = Locale(identifier: "en_US_POSIX")

            let postsUpdate = PostsUpdate(
                updateTime: dateFormatter.date(from: "2019-02-18T21:24:00Z")!
            )

            it("has an update time") {
                expect(postsUpdate.updateTime) == dateFormatter.date(from: "2019-02-18T21:24:00Z")!
            }

            context("when parsed") {
                let data = Data(from: "posts/update.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let postsUpdate = try! decoder.decode(PostsUpdate.self, from: data)

                it("can be parsed from json") {
                    expect(postsUpdate.updateTime) == dateFormatter.date(from: "2019-02-18T21:24:00Z")!
                }
            }
        }
    }
}
