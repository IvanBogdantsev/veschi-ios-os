// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit

protocol PhoneNumberUtilityProtocol {
    func isValidPhoneNumber(_ numberString: String) -> Bool
    func dialingCode(for countryISOCode: String) -> String?
}

extension PhoneNumberUtility: PhoneNumberUtilityProtocol {
    func isValidPhoneNumber(_ numberString: String) -> Bool {
        return isValidPhoneNumber(numberString, ignoreType: false)
    }
    
    func dialingCode(for countryISOCode: String) -> String? {
        if let dialingCode = countryCode(for: countryISOCode) {
            return String(dialingCode)
        }
        return nil
    }
}
