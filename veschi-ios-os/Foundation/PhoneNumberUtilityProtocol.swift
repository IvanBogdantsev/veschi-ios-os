// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit

protocol PhoneNumberUtilityProtocol {
    func isValidPhoneNumber(_ numberString: String) -> Bool
    func dialingCode(for countryISOCode: String) -> String?
    func parse(_ phoneNumber: String) -> PhoneNumber?
    func getRegionISOCodes(by mainCountryISOCode: String) -> [String]
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
    
    func parse(_ phoneNumber: String) -> PhoneNumber? {
        return try? self.parse(phoneNumber, ignoreType: false)
    }
    
    func getRegionISOCodes(by mainCountryISOCode: String) -> [String] {
        guard let dialingCode = countryCode(for: mainCountryISOCode),
              let regionISOCodes = countries(withCode: dialingCode) else { return [] }
        return regionISOCodes
    }
}
