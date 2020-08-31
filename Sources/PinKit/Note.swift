//
//  Note.swift
//  PinKit
//
//  Created by Ben Chatelain on 8/30/20.
//

import Foundation

struct Note: Decodable {
    let id: String
    let hash: String
    let title: String
    let length: Int
    let createdAt: Date
    let updatedAt: Date
}
