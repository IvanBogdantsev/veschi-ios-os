//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

protocol AuthViewModelInputs {
    func viewDidLoad()
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
    
    // MARK: I/0
    var inputs: AuthViewModelInputs { self }
    var outputs: AuthViewModelOutputs { self }
    
    // MARK: Outputs
    var countryCodeButtonText: Observable<String>!
    var presentCountryCodesList: Observable<Void>!
    var formattedPhoneNumber: Observable<String>!
    var formIsValid: Observable<Bool>!
    
    // MARK: Values
    private let viewDidLoadValue = PublishSubject<Void>()
    private let presentCountryCodesListValue = PublishSubject<Void>()
    private let phoneNumberChangedValue = PublishSubject<String>()
    
    // MARK: Services
    private let phoneNumberUtility: PhoneNumberUtilityProtocol
    private let phoneNumberFormatter: PhoneNumberFormatterProtocol
    
    init(
        phoneNumberUtility: PhoneNumberUtilityProtocol,
        phoneNumberFormatter: PhoneNumberFormatterProtocol
    ) {
        self.phoneNumberUtility = phoneNumberUtility
        self.phoneNumberFormatter = phoneNumberFormatter
        
        presentCountryCodesList = presentCountryCodesListValue
        
        let supposedCountryText = viewDidLoadValue
            .map { _ in
                return self.getCountryInfoButtonText(by: Environment.locale.region?.identifier)
            }
        
        formattedPhoneNumber = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneNumberFormatter.formatPartial(phoneNumber)
            }
        
        let currentCountryText = phoneNumberChangedValue
            .withLatestFrom(formattedPhoneNumber)
            .map { _ in
                return self.getCountryInfoButtonText(by: phoneNumberFormatter.currentCountry)
            }
        
        countryCodeButtonText = Observable.merge(supposedCountryText, currentCountryText)
        
        formIsValid = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneNumberUtility.isValidPhoneNumber(phoneNumber)
            }
    }
    
}

extension AuthViewModel {
    private func getCountryInfoButtonText(by ISOCode: String?) -> String {
        guard let ISOCode else { return Emojis.whiteFlag }
        let countryName = Environment.locale.localizedString(
            forRegionCode: ISOCode
        ) ?? ""
        let countryDialingCode = phoneNumberUtility.dialingCode(
            for: ISOCode
        ) ?? ""
        return "\(ISOCode.asEmojiFlag) \(countryName) +\(countryDialingCode)"
    }
}

extension AuthViewModel: AuthViewModelInputs {
    func viewDidLoad() {
        viewDidLoadValue.onNext(Void())
    }
    
    func countryCodeButtonTapped() {
        presentCountryCodesListValue.onNext(Void())
    }
    
    func phoneNumberChanged(_ phoneNumber: String) {
        phoneNumberChangedValue.onNext(phoneNumber)
    }
}
