//
//  TagsSuggest.swift
//  PinKit
//
//  Created by Ben Chatelain on 8/30/20.
//

/// List of tag suggestions for a given URL. Renamed from posts/suggest as listed in the Pinboard API since
///  this endpoint returns tags, not pages.
/// https://pinboard.in/api/#posts_suggest
struct TagsSuggest: Decodable {
    let popular: [String]
    let recommended: [String]
}

extension TagsSuggest {
    // MARK: Decoder (custom)

    public init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()

        // Extract the array values from the dictionaries
        popular = try values.decode([String: [String]].self)["popular"]!
        recommended = try values.decode([String: [String]].self)["recommended"]!
    }
}
