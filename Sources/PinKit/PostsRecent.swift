import Foundation

/// Model of the response containing most recent posts.
struct PostsRecent: Decodable {
    let date: Date
    let user: String
    let posts: [Post]
}
