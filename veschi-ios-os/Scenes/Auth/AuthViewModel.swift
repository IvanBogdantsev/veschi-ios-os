//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

protocol AuthViewModelInputs {
    func viewDidLoad()
    func countryCodeButtonTapped()
}

protocol AuthViewModelOutputs {
    var showCountryCodeLoading: Observable<Void>! { get }
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
    var presentCountryCodesList: Observable<Void>!
    
    private let viewDidLoadValue = PublishSubject<Void>()
    private let presentCountryCodesListValue = PublishSubject<Void>()
    
    private let userAccount: UserAccountProtocol
    
    init(userAccount: UserAccountProtocol) {
        self.userAccount = userAccount
        
        showCountryCodeLoading = viewDidLoadValue
        presentCountryCodesList = presentCountryCodesListValue
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
