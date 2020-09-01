@testable import PinKit
import Nimble
import Quick
import Foundation

class PostsDatesSpec: QuickSpec {
    override func spec() {
        describe("post counts by date") {
            let postsDates = PostsDates(
                user: "phatblat",
                tag: "",
                dates: [:]
            )

            it("has a user") {
                expect(postsDates.user) == "phatblat"
            }
            it("has no tags") {
                expect(postsDates.tag) == ""
            }
            it("has an empty map of dates") {
                expect(postsDates.dates.count) == 0
            }

            context("when parsed") {
                let data = Data(from: "posts/dates.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let postsDates = try! decoder.decode(PostsDates.self, from: data)

                it("has a user") {
                    expect(postsDates.user) == "phatblat"
                }
                it("has no tags") {
                    expect(postsDates.tag) == ""
                }
                it("has some dates") {
                    expect(postsDates.dates.count) == 2939
                }
            }
        }
    }
}
