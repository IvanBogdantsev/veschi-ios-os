//  veschi-ios-os
//  Created by Ivan B.

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
