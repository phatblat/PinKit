//
//  Service.swift
//  Nimble
//
//  Created by Ben Chatelain on 3/2/19.
//

import Foundation

struct Service {
    enum Posts {
        case update
        case add
        case delete
        case get
        case recent
        case dates
        case all
        case suggest
    }
    enum Tags {
        case delete
        case get
        case rename
    }
    enum User {
        case secret
        case apiToken
    }
    enum Notes {
        case list
        case id
    }
}
