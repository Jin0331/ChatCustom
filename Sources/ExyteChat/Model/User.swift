//
//  Created by Alex.M on 17.06.2022.
//

import Foundation

public struct User: Codable, Identifiable, Hashable {
    public let id: String
    public let name: String
    public let avatarURL: URL?
    public let isCurrentUser: Bool
    public let secretKey : String?
    public let accessToken : String?

    public init(id: String, name: String, avatarURL: URL?, isCurrentUser: Bool, secretKey: String? = nil, accessToken: String? = nil) {
        self.id = id
        self.name = name
        self.avatarURL = avatarURL
        self.isCurrentUser = isCurrentUser
        self.secretKey = secretKey
        self.accessToken = accessToken
    }
    
    var avatarURLToRequest: URLRequest? {
        guard let avatarURL = avatarURL, let secretKey = secretKey, let accessToken = accessToken else { return nil }
        
        var request = URLRequest(url: avatarURL)
        request.addValue(secretKey, forHTTPHeaderField: "SesacKey")
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        return request
    }
}
