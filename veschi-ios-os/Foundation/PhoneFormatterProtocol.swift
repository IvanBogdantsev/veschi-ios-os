// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit

protocol PhoneFormatterProtocol {
    var currentCountry: String { get }
    
    func formatPartial(_ rawNumber: String) -> String
}

extension PartialFormatter: PhoneFormatterProtocol {
    // in the name of wording 🙏
    var currentCountry: String {
        return currentRegion
    }
}
