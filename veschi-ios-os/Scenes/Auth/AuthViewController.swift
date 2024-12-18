//  veschi-ios-os
//  Created by Ivan B.

import RxCocoa
import UIKit

final class AuthViewController: BaseViewController, EndsEditingOnTap {
    
    private let contentView = AuthView()
    private let countryCodesNavigationController = BaseNavigationController()
    private let countryCodesTableViewController = CountryCodesSearchTableViewController()
    private let keyboardIntersectionTracker = KeyboardIntersectionTracker()
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
        super.basicSetup()
        setupEndEditingBehaviour()
        keyboardIntersectionTracker.startTrackingIntersection(
            of: contentView.stackView,
            in: contentView
        )
        countryCodesNavigationController.viewControllers = [countryCodesTableViewController]
        contentView.telephoneNumberTextField.delegate = self
        contentView.telephoneNumberTextField.addBarButtons(
            UIBarButtonItem(
                title: Strings.send,
                style: .done,
                target: self,
                action: #selector(didTapSendBarButton)
            )
        )
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
                    self?.viewModel.inputs.didTapCountryCodeButton()
                }
            )
            .disposed(by: disposeBag)
        
        countryCodesTableViewController.onSelection = { [weak self] country in
            self?.viewModel.inputs.didChooseCountryFromTable(country.ISOCode)
            self?.countryCodesNavigationController.dismiss(animated: true)
        }
    }
    
}

extension AuthViewController {
    @objc
    func didTapSendBarButton() {
        view.endEditing(true)
        // TODO: bind to telephone send
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
            viewModel.inputs.phoneNumberDidChange(newText)
        }
        return false
    }
}
