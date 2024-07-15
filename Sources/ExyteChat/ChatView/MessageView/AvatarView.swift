//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI

struct AvatarView: View {

    let url: URLRequest?
    let avatarSize: CGFloat

    var body: some View {
        CachedAsyncImage(urlRequest: url, urlCache: .imageCache) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle().fill(Color.gray)
        }
        .viewSize(avatarSize)
        .clipShape(Circle())
    }
}
