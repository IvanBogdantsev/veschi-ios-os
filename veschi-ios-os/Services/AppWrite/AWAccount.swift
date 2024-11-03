//
//  UserAccount.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 04.09.2023.
//

import Appwrite
// not final
// swiftlint:disable:next final_class
class AWAccount: AWClient {
    
    lazy var account: Account = {
        Account(client)
    }()
    
}
