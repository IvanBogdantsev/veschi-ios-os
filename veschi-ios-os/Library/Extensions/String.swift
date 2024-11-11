//  veschi-ios-os
//  Created by Ivan B.

import Foundation

extension String {
    var asEmojiFlag: String {
        guard Locale.Region.isoRegions.map(\.identifier).contains(self) else {
            // TODO: do i need debug print? 
            debugPrint("Unknown region: \(self)")
            return self
        }
        return self
            .uppercased()
            .unicodeScalars
            .compactMap { UnicodeScalar(127397 + $0.value) }
            .reduce(into: "") { $0.unicodeScalars.append($1) }
    }
    
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
