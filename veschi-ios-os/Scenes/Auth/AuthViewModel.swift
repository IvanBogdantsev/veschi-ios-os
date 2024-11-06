//  veschi-ios-os
//  Created by Ivan B.

import RxSwift

protocol AuthViewModelInputs {
    func countryCodeButtonTapped()
}

protocol AuthViewModelOutputs {
    //    var eventName: Observable<String>! { get }
}

protocol AuthViewModelProtocol {
    var inputs: AuthViewModelInputs { get }
    var outputs: AuthViewModelOutputs { get }
}

final class AuthViewModel: AuthViewModelProtocol, AuthViewModelOutputs {
    
    var inputs: AuthViewModelInputs { self }
    var outputs: AuthViewModelOutputs { self }
    
    //    var eventName: Observable<String>!
    
    private let userAccount: UserAccountProtocol
    
    init(userAccount: UserAccountProtocol) {
        self.userAccount = userAccount
    }
    
}

extension AuthViewModel: AuthViewModelInputs {
    func countryCodeButtonTapped() {
        
    }
}
