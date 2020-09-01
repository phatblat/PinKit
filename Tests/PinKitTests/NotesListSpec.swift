@testable import PinKit
import Nimble
import Quick
import Foundation

class NotesListSpec: QuickSpec {
    override func spec() {
        describe("all notes") {
            context("when parsed") {
                let data = Data(from: "notes/list.json")

                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let allNotes = try! decoder.decode(NotesList.self, from: data)

                it("contains 1 note") {
                    expect(allNotes.count) == 1
                }
            }
        }
    }
}
