import Foundation

/// Model of the response from querying for the last post update.
struct PostsUpdate: Decodable {
    let updateTime: Date
}
