//
//  Created by Alex.M on 08.07.2022.
//

import Foundation

extension DateFormatter {
    static let timeFormatter = {
        let formatter = DateFormatter()

        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm a"

        return formatter
    }()

    static let relativeDateFormatter = {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .full
        relativeDateFormatter.locale = Locale(identifier: "ko_KR")
        relativeDateFormatter.doesRelativeDateFormatting = true
        relativeDateFormatter.dateFormat = "yyyy년 M월 d일"

        return relativeDateFormatter
    }()

    static func timeString(_ seconds: Int) -> String {
        let hour = Int(seconds) / 3600
        let minute = Int(seconds) / 60 % 60
        let second = Int(seconds) % 60

        if hour > 0 {
            return String(format: "%02i:%02i:%02i", hour, minute, second)
        }
        return String(format: "%02i:%02i", minute, second)
    }
}
