//  veschi-ios-os
//  Created by Ivan B.

import Foundation
import RxSwift

protocol AuthViewModelInputs {
    func viewDidLoad()
    func countryCodeButtonTapped()
    func phoneNumberChanged(_ phoneNumber: String)
    func didChooseCountryFromTable(_ ISOCode: String)
}

protocol AuthViewModelOutputs {
    var countryCodeButtonText: Observable<String>! { get }
    var presentCountryCodesList: Observable<Void>! { get }
    var textFieldValue: Observable<String>! { get }
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
    var textFieldValue: Observable<String>!
    var formIsValid: Observable<Bool>!
    
    // MARK: Values
    private let viewDidLoadValue = PublishSubject<Void>()
    private let presentCountryCodesListValue = PublishSubject<Void>()
    private let phoneNumberChangedValue = PublishSubject<String>()
    private let didChooseCountryFromTableValue = PublishSubject<String>()
    
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
        
        let supposedCountryDialingCode: Observable<String> = viewDidLoadValue
            .compactMap {
                return self.getDialingCode(for: phoneNumberFormatter.currentCountry)
            }
        
        let countryDialingCodeFromTable: Observable<String> = didChooseCountryFromTableValue
            .compactMap { ISOCode in
                return self.getDialingCode(for: ISOCode)
            }
        
        let formattedPhoneNumber = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneNumberFormatter.formatPartial(phoneNumber)
            }
            .share()
        
        let formattedFromNumberButtonText = formattedPhoneNumber
            .map { phoneNumber in
                if let parsedISOCode = phoneNumberUtility.parse(phoneNumber)?.regionID {
                    return self.getCountryInfoButtonText(by: parsedISOCode)
                }
                let regionISOCodes = phoneNumberUtility.getRegionISOCodes(
                    by: phoneNumberFormatter.currentCountry
                )
                return self.getCountryInfoButtonText(by: regionISOCodes)
            }
        
        let formattedFromISOCodeButtonText = didChooseCountryFromTableValue
            .map { ISOCode in
                return self.getCountryInfoButtonText(by: [ISOCode])
            }
        
        countryCodeButtonText = Observable.merge(formattedFromISOCodeButtonText, formattedFromNumberButtonText)
            .startWith(getInitialButtonText())
        
        textFieldValue = Observable.merge(
            supposedCountryDialingCode,
            formattedPhoneNumber,
            countryDialingCodeFromTable
        )
        .map { text in
            return "+\(text.trimmingCharacters(in: CharacterSet(charactersIn: "+")))"
        }
        
        formIsValid = phoneNumberChangedValue
            .map { phoneNumber in
                return phoneNumberUtility.isValidPhoneNumber(phoneNumber)
            }
    }
    
}

extension AuthViewModel {
    private func getDialingCode(for ISOCode: String) -> String? {
        guard let dialingCode = phoneNumberUtility.dialingCode(
            for: ISOCode
        ) else { return nil }
        return dialingCode
    }
    
    private func getInitialButtonText() -> String {
        let currentCountryISOCode = phoneNumberFormatter.currentCountry
        let regionISOCodes = phoneNumberUtility.getRegionISOCodes(by: currentCountryISOCode)
        return getCountryInfoButtonText(by: regionISOCodes)
    }
    
    private func getCountryInfoButtonText(by ISOCodes: [String]) -> String {
        guard let firstISOCode = ISOCodes.first else { return "" }
        let mainCountryInfo = getCountryInfoButtonText(by: firstISOCode)
        return ISOCodes.count > 1
        ? "\(mainCountryInfo) \(Strings.and_num_more(num: ISOCodes.count - 1))"
        : mainCountryInfo
    }
    
    private func getCountryInfoButtonText(by ISOCode: String) -> String {
        let countryName = Environment.locale.localizedString(
            forRegionCode: ISOCode
        ) ?? ""
        return "\(ISOCode.asEmojiFlag) \(countryName)"
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
    
    func didChooseCountryFromTable(_ ISOCode: String) {
        didChooseCountryFromTableValue.onNext(ISOCode)
    }
}
