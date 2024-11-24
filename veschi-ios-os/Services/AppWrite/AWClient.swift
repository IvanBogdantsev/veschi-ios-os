//  veschi-ios-os
//  Created by Ivan B.

import Appwrite

// not final
// swiftlint:disable:next final_class
class AWClient {
    
    let client: Client
    
    init() {
        client = Client()
            .setEndpoint(AWConstants.endpoint)
            .setProject(AWConstants.projectId)
    }
    
}
