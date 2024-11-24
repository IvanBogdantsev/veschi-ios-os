//  veschi-ios-os
//  Created by Ivan B.

import Appwrite

// not final
// swiftlint:disable:next final_class
class AWAccount: AWClient {
    
    lazy var account: Account = {
        Account(client)
    }()
    
}
