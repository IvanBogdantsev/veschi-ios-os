//
//  AuthViewController.swift
//
//
//  Created by  Ivan B  on 27.05.22.
//
//

import UIKit

final class AuthViewController: UIViewController {
    
    private let viewModel: AuthViewModelProtocol
    
    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
