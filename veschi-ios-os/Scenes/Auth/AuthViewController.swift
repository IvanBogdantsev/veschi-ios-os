//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AuthViewController: BaseViewController {
    
    private let contentView = AuthView()
    private let viewModel: AuthViewModelProtocol
    
    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
}
