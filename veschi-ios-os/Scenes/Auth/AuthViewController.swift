//  veschi-ios-os
//  Created by Ivan B.

import RxCocoa
import UIKit

final class AuthViewController: BaseViewController {
    
    private let contentView = AuthView()
    private let countryCodesNavigationController = BaseNavigationController()
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapContentView))
        view.addGestureRecognizer(tapGesture)
        contentView.telephoneNumberTextField.delegate = self
    }
    
    override func bindViewModel() {
        viewModel.outputs.presentCountryCodesList
            .subscribe(
                onNext: { [weak self] in
                    guard let self else { return }
                    self.present(self.countryCodesNavigationController, animated: true)
                }
            )
            .disposed(by: disposeBag)
        
        viewModel.outputs.countryCodeButtonText
            .observeOnMainThread()
            .subscribe(
                onNext: { [weak self] text in
                    self?.contentView.countryCodeButton.setTitle(text, for: .normal)
                },
                onError: { error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
        
        viewModel.outputs.textFieldValue
            .subscribe(
                onNext: { [weak self] phoneNumber in
                    self?.contentView.telephoneNumberTextField.text = phoneNumber
                }
            )
            .disposed(by: disposeBag)
        
        viewModel.outputs.formIsValid
            .subscribe(
                onNext: { isValid in
                    print(isValid)
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
        
        countryCodesTableViewController.onSelection = { [weak self] country in
            self?.viewModel.inputs.didChooseCountryFromTable(country.ISOCode)
            self?.countryCodesNavigationController.dismiss(animated: true)
        }
    }
    
    @objc
    private func didTapContentView() {
        contentView.endEditing(true)
    }
    
}

extension AuthViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if let currentText = textField.text as? NSString {
            let newText = currentText.replacingCharacters(in: range, with: string)
            viewModel.inputs.phoneNumberChanged(newText)
        }
        return false
    }
}
