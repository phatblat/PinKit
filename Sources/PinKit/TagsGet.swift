import Foundation

/// Model of the response counts of posts for each day.
@dynamicMemberLookup
struct TagsGet: Decodable {
    let tags: [String: Int]

    subscript(index: String) -> Int? {
        return tags[index]
    }

    subscript(dynamicMember member: String) -> Int? {
        return tags[member]
    }
}

extension TagsGet {
    // MARK: Decoder (custom)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempDictionary = [String: Int]()
        for key in container.allKeys {
            // Decode Student using key & keep decoded Student object in tempArray
            let decodedObject = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)

            tempDictionary[key.stringValue] = Int(decodedObject)!
        }
        
        tags = tempDictionary
    }

    // Define DynamicCodingKeys type needed for creating
    // decoding container from JSONDecoder
    private struct DynamicCodingKeys: CodingKey {
        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
    }
}
