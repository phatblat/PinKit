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
                let fileURL = Bundle.jsonResponse(fileName: "posts/add.json")!
                let data = try! Data(contentsOf: fileURL, options: .mappedIfSafe)
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

extension Bundle {
    /// Locates a JSON response file from the test bundle.
    ///
    /// - Parameter fileName: Name of file to locate.
    /// - Returns: URL to file.
    static func jsonResponse(fileName: String) -> URL? {
        return Bundle(for: PostsAddSpec.self).fileURL(fileName: fileName)
    }

    /// Builds a URL for a file in the JSON directory of the current bundle.
    ///
    /// - Parameter fileName: Name of file to locate.
    /// - Returns: URL to file.
    func fileURL(fileName: String) -> URL? {
        guard let path = self.path(forResource: fileName.fileNameWithoutExtension,
                                   ofType: fileName.fileExtension,
                                   inDirectory: "JSON")
            else { fatalError("Unable to load file \(fileName)") }

        return URL(fileURLWithPath: path)
    }
}

extension String {
    /// Returns the file name before the extension.
    var fileNameWithoutExtension: String {
        return (self as NSString).deletingPathExtension
    }

    /// Returns the file extension.
    var fileExtension: String {
        return (self as NSString).pathExtension
    }
}
