//  veschi-ios-os
//  Created by Ivan B.

protocol AuthViewModelInputs {
    
}

protocol AuthViewModelOutputs {
    
}

protocol AuthViewModelProtocol {
    var inputs: AuthViewModelInputs { get }
    var outputs: AuthViewModelOutputs { get }
}

final class AuthViewModel: AuthViewModelProtocol, AuthViewModelOutputs {
    
    var inputs: AuthViewModelInputs { self }
    var outputs: AuthViewModelOutputs { self }
    
    private let userAccount: UserAccountProtocol
    
    init(userAccount: UserAccountProtocol) {
        self.userAccount = userAccount
    }
    
}

extension AuthViewModel: AuthViewModelInputs {
    
}
