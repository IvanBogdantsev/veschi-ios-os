//  veschi-ios-os
//  Created by Ivan B.

import RxSwift
import UIKit
// not final
// swiftlint:disable:next final_class
class BaseViewController: UIViewController {
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSetup()
        bindViewModel()
        bindActions()
    }
    
    func basicSetup() {
        tapGestureRecognizer.addTarget(self, action: #selector(didTapContentView))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func bindViewModel() {}
    
    func bindActions() {}
    
}

extension BaseViewController {
    @objc
    private func didTapContentView() {
        view.endEditing(true)
    }
}
