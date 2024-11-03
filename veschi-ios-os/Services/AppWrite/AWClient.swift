//
//  AWClient.swift
//  Let's Go
//
//  Created by Vanya Bogdantsev on 23.09.2023.
//

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
