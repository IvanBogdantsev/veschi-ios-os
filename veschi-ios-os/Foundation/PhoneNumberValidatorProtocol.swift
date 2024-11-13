// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit

protocol PhoneNumberValidatorProtocol {
    func isValidPhoneNumber(_ numberString: String) -> Bool
}

extension PhoneNumberUtility: PhoneNumberValidatorProtocol {
    func isValidPhoneNumber(_ numberString: String) -> Bool {
        return isValidPhoneNumber(numberString, ignoreType: false)
    }
}
