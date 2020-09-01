@testable import PinKit
import Nimble
import Quick
import Foundation

class UserSecretSpec: QuickSpec {
    override func spec() {
        describe("user secret") {
            let userSecret = UserSecret(
                result: "blah"
            )

            it("has a result") {
                expect(userSecret.result) == "blah"
            }

            context("when parsed") {
                let data = Data(from: "user/secret.json")
                let decoder = JSONDecoder()
                let userSecret = try! decoder.decode(UserSecret.self, from: data)

                it("has a result") {
                    expect(userSecret.result) == "3a44165144ca5b5091a4"
                }
            }
        }
    }
}
