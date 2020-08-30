import Foundation

/// Model of the response counts of posts for each day.
struct PostsDates: Decodable {
    let user: String
    let tag: String
    let dates: [String: Int]

    enum CodingKeys: String, CodingKey {
        case user
        case tag
        case dates
    }
}

extension PostsDates {
    // MARK: Decoder (custom)

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        user = try values.decode(String.self, forKey: .user)
        tag = try values.decode(String.self, forKey: .tag)

        dates = try values.decode(Dictionary<String, String>.self, forKey: .dates)
            // Convert String value to Int
            .mapValues { Int($0)! }
    }
}
