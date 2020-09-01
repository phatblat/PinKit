/// Response containing user's secret RSS key, used for viewing private feeds.
struct UserSecret: Decodable {
    let result: String
}
