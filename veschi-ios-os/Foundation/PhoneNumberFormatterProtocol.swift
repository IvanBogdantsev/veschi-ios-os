// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit

protocol PhoneNumberFormatterProtocol {
    var currentCountry: String { get }
    
    func formatPartial(_ rawNumber: String) -> String
}

extension PartialFormatter: PhoneNumberFormatterProtocol {
    // in the name of wording 🙏
    var currentCountry: String {
        return currentRegion
    }
}
