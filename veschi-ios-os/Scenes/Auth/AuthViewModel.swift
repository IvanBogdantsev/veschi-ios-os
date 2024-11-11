//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

protocol AuthViewModelInputs {
    func viewDidLoad()
    func countryCodeButtonTapped()
}

protocol AuthViewModelOutputs {
    var showCountryCodeLoading: Observable<Void>! { get }
    var hideCountryCodeLoading: Observable<Void>! { get }
    var countryCodeButtonText: Observable<String>! { get }
    var presentCountryCodesList: Observable<Void>! { get }
}

protocol AuthViewModelProtocol {
    var inputs: AuthViewModelInputs { get }
    var outputs: AuthViewModelOutputs { get }
}

final class AuthViewModel: AuthViewModelProtocol, AuthViewModelOutputs {
    
    var inputs: AuthViewModelInputs { self }
    var outputs: AuthViewModelOutputs { self }
    
    var showCountryCodeLoading: Observable<Void>!
    var hideCountryCodeLoading: Observable<Void>!
    var countryCodeButtonText: Observable<String>!
    var presentCountryCodesList: Observable<Void>!
    
    private let viewDidLoadValue = PublishSubject<Void>()
    private let presentCountryCodesListValue = PublishSubject<Void>()
    
    private let userAccount: UserAccountProtocol
    private let database: DatabaseProtocol
    
    init(userAccount: UserAccountProtocol, database: DatabaseProtocol) {
        self.userAccount = userAccount
        self.database = database
        
        showCountryCodeLoading = viewDidLoadValue
        presentCountryCodesList = presentCountryCodesListValue
        
        let countryTelephoneCodes = viewDidLoadValue
            .flatMapLatest {
                Observable<[CountryTelephoneCode]>.createAsync {
                    try await database.getItems(of: CountryTelephoneCode.self, from: .countryTelephoneCodes)
                }
            }
            .share()
        
        let supposedUserCountryCode = countryTelephoneCodes
            .map { countryTelephoneCodes in
                return self.getSupposedUserCountryCode(from: countryTelephoneCodes)
            }
        
        hideCountryCodeLoading = countryTelephoneCodes.ignoreValues()
        
        countryCodeButtonText = supposedUserCountryCode
            .map { supposedCode in
                return self.formatCountryCodeButtonText(for: supposedCode)
            }
    }
    
}

extension AuthViewModel {
    private func getSupposedUserCountryCode(from codes: [CountryTelephoneCode]) -> CountryTelephoneCode {
        if let region = Environment.locale.region?.identifier,
           let codeByRegion = codes.first(where: { $0.countryCode == region }) {
            return codeByRegion
        }
        return codes.sorted { $0.callingCode < $1.callingCode }[0]
    }
    
    private func formatCountryCodeButtonText(for code: CountryTelephoneCode) -> String {
        return "\(code.countryCode.asEmojiFlag) \(code.countryName) +\(code.callingCode)"
    }
}

extension AuthViewModel: AuthViewModelInputs {
    func viewDidLoad() {
        viewDidLoadValue.onNext(Void())
    }
    
    func countryCodeButtonTapped() {
        presentCountryCodesListValue.onNext(Void())
    }
}
