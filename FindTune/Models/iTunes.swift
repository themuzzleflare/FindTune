import Foundation

struct iTunes: Codable, Hashable {
    var platform: PlatformEnum
    var version: String
    var datefound: String?
    var url: String
    var releasedate: String?
    var uploaddate: String?
    
    enum PlatformEnum: String, CaseIterable, Codable, Hashable {
        case windows = "Windows"
        case macos = "Mac OS X"
    }
}
