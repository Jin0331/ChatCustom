//
//  Created by Alex.M on 16.06.2022.
//

import Foundation
import ExyteMediaPicker

public enum AttachmentType: String, Codable {
    case image
    case video

    public var title: String {
        switch self {
        case .image:
            return "Image"
        default:
            return "Video"
        }
    }

    public init(mediaType: MediaType) {
        switch mediaType {
        case .image:
            self = .image
        default:
            self = .video
        }
    }
}

public struct Attachment: Codable, Identifiable, Hashable {
    public let id: String
    public let thumbnail: URL
    public let full: URL
    public let type: AttachmentType
    public let secretKey : String?
    public let accessToken : String?
    
    var thumbnailToRequest: URLRequest {
        guard let secretKey = secretKey, let accessToken = accessToken else { return URLRequest(url: thumbnail)}
        
        var request = URLRequest(url: thumbnail)
        request.addValue(secretKey, forHTTPHeaderField: "SesacKey")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        return request
    }
    
    // full URL을 URLRequest로 변환하고 헤더 값을 설정하는 연산 프로퍼티
    var fullToRequest: URLRequest {
        guard let secretKey = secretKey, let accessToken = accessToken else { return URLRequest(url: full)}
        
        var request = URLRequest(url: full)
        request.addValue(secretKey, forHTTPHeaderField: "SesacKey")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        return request
    }
    
    public init(id: String, thumbnail: URL, full: URL, type: AttachmentType, secretKey: String? = nil, accessToken: String? = nil) {
        self.id = id
        self.thumbnail = thumbnail
        self.full = full
        self.type = type
        self.secretKey = secretKey
        self.accessToken = accessToken
    }

    public init(id: String, url: URL, type: AttachmentType, secretKey: String? = nil, accessToken: String? = nil) {
        self.init(id: id, thumbnail: url, full: url, type: type, secretKey: secretKey, accessToken: accessToken)
    }
}
