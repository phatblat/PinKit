@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsAllSpec: QuickSpec {
    override func spec() {
        describe("all posts") {
            context("when parsed") {
                let data = Data(from: "posts/all.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let allPosts = try! decoder.decode([Post].self, from: data)

                it("contains 42 posts") {
                    expect(allPosts.count) == 42
                }
            }
        }
    }
}
