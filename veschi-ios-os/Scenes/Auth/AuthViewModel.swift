//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

protocol AuthViewModelInputs {
    func countryCodeButtonTapped()
    func phoneNumberChanged(_ phoneNumber: String)
}

protocol AuthViewModelOutputs {
    var countryCodeButtonText: Observable<String>! { get }
    var presentCountryCodesList: Observable<Void>! { get }
    var formattedPhoneNumber: Observable<String>! { get }
    var formIsValid: Observable<Bool>! { get }
}

protocol AuthViewModelProtocol {
    var inputs: AuthViewModelInputs { get }
    var outputs: AuthViewModelOutputs { get }
}

final class AuthViewModel: AuthViewModelProtocol, AuthViewModelOutputs {
    
    var inputs: AuthViewModelInputs { self }
    var outputs: AuthViewModelOutputs { self }
    
    var countryCodeButtonText: Observable<String>!
    var presentCountryCodesList: Observable<Void>!
    var formattedPhoneNumber: Observable<String>!
    var formIsValid: Observable<Bool>!
    
    private let presentCountryCodesListValue = PublishSubject<Void>()
    private let phoneNumberChangedValue = PublishSubject<String>()
    
    init(
        phoneNumberValidator: PhoneNumberValidatorProtocol,
        phoneFormatter: PhoneFormatterProtocol
    ) {
        presentCountryCodesList = presentCountryCodesListValue
        
        //        let supposedUserCountryText = countryTelephoneCodes
        //            .map { countryTelephoneCodes in
        //                let supposedUserCountryText = self.getSupposedUserCountryCode(from: countryTelephoneCodes)
        //                return self.formatCountryCodeButtonText(for: supposedUserCountryText)
        //            }
        
        formattedPhoneNumber = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneFormatter.formatPartial(phoneNumber)
            }
        
        //        let currentCountryText = formattedPhoneNumber
        //            .withLatestFrom(countryTelephoneCodes) { $1 }
        //            .map { countryTelephoneCodes in
        //                let currentCountryCode = phoneFormatter.currentCountry
        //                if let currentCode = countryTelephoneCodes.first(
        //                    where: { $0.countryCode == currentCountryCode }
        //                ) {
        //                    return self.formatCountryCodeButtonText(for: currentCode)
        //                } else {
        //                    return "\(Emojis.whiteFlag) "
        //                }
        //            }
        
        //        countryCodeButtonText = Observable.merge(supposedUserCountryText, currentCountryText)
        
        formIsValid = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneNumberValidator.isValidPhoneNumber(phoneNumber)
            }
    }
    
}

extension AuthViewModel {
    //    private func getSupposedUserCountryCode(from codes: [CountryTelephoneCode]) -> CountryTelephoneCode {
    //        if let region = Environment.locale.region?.identifier,
    //           let codeByRegion = codes.first(where: { $0.countryCode == region }) {
    //            return codeByRegion
    //        }
    //        return codes.sorted { $0.callingCode < $1.callingCode }[0]
    //    }
    //    
    //    private func formatCountryCodeButtonText(for code: CountryTelephoneCode) -> String {
    //        return "\(code.countryCode.asEmojiFlag) \(code.countryName) +\(code.callingCode)"
    //    }
}

extension AuthViewModel: AuthViewModelInputs {    
    func countryCodeButtonTapped() {
        presentCountryCodesListValue.onNext(Void())
    }
    
    func phoneNumberChanged(_ phoneNumber: String) {
        phoneNumberChangedValue.onNext(phoneNumber)
    }
}
