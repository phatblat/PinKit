@testable import PinKit
import Nimble
import Quick
import Foundation

class NoteSpec: QuickSpec {
    override func spec() {
        describe("note") {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            let note = Note(
                id: "123",
                hash: "abf123",
                title: "great note",
                length: 19,
                createdAt: Date.distantPast,
                updatedAt: Date.distantFuture
            )

            it("has an id") {
                expect(note.id) == "123"
            }
            it("has hash") {
                expect(note.hash) == "abf123"
            }
            it("has a title") {
                expect(note.title) == "great note"
            }
            it("has a length") {
                expect(note.length) == 19
            }
            it("has a creaated date") {
                expect(note.createdAt) == Date.distantPast
            }
            it("has an updated date") {
                expect(note.updatedAt) == Date.distantFuture
            }
            
            context("when parsed") {
                let data = Data(from: "notes/single.json")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let note = try! decoder.decode(Note.self, from: data)

                it("has an id") {
                    expect(note.id) == "2c8db085b18bd3ba10e0"
                }
                it("has hash") {
                    expect(note.hash) == "42c06abbdbf36a608017"
                }
                it("has a title") {
                    expect(note.title) == "note title"
                }
                it("has a length") {
                    expect(note.length) == 32
                }
                it("has a creaated date") {
                    expect(note.createdAt) == dateFormatter.date(from: "2020-08-31 05:30:53")!
                }
                it("has an updated date") {
                    expect(note.updatedAt) == dateFormatter.date(from: "2020-08-31 05:30:53")!
                }
            }
        }
    }
}
