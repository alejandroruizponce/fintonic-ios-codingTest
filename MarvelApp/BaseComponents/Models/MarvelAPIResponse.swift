import Foundation

// MARK: - MarvelAPIResponse
struct MarvelAPIResponse: Codable {
    let code: Int
    let data: DataResponse
    let status: String
    let copyright: String
    let attributionText: String
    let etag: String
}

// MARK: - Data
struct DataResponse: Codable {
    let count, limit, offset, total: Int
    let results: [Result]
}

// MARK: - Response
struct Result: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let comics: Comics
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let extensionThumb: String

    enum CodingKeys: String, CodingKey {
        case path
        case extensionThumb = "extension"
    }
}

// MARK: - Comics
struct Comics: Codable {
   let available: Int
}
