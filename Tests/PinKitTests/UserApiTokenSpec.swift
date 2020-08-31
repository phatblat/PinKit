@testable import PinKit
import Nimble
import Quick
import Foundation

class UserApiTokenSpec: QuickSpec {
    override func spec() {
        describe("user api token") {
            let userApiToken = UserApiToken(
                result: "blah"
            )

            it("has a result") {
                expect(userApiToken.result) == "blah"
            }

            context("when parsed") {
                let data = Data(from: "user/api_token.json")
                let decoder = JSONDecoder()
                let userApiToken = try! decoder.decode(UserApiToken.self, from: data)

                it("has a result") {
                    expect(userApiToken.result) == "DBCDB0B46CE04FFE3DB2"
                }
            }
        }
    }
}
