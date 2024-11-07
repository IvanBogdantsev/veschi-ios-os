//  veschi-ios-os
//  Created by Ivan B.

import RxCocoa
import UIKit

final class AuthViewController: BaseViewController {
    
    private let contentView = AuthView()
    private let countryCodesNavigationController = UINavigationController()
    private let countryCodesTableViewController = CountryCodesSearchTableViewController()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputs.viewDidLoad()
    }
    
    override func basicSetup() {
        countryCodesNavigationController.viewControllers = [countryCodesTableViewController]
    }
    
    override func bindViewModel() {
        viewModel.outputs.showCountryCodeLoading
            .subscribe(
                onNext: { [weak self] in
                    
                }
            )
            .disposed(by: disposeBag)
        
        viewModel.outputs.presentCountryCodesList
            .subscribe(
                onNext: { [weak self] in
                    guard let self else { return }
                    self.present(self.countryCodesNavigationController, animated: true)
                }
            )
            .disposed(by: disposeBag)
    }
    
    override func bindActions() {
        contentView.countryCodeButton.rx.tap
            .subscribe(
                onNext: { [weak self] in
                    self?.viewModel.inputs.countryCodeButtonTapped()
                }
            )
            .disposed(by: disposeBag)
    }
    
}
