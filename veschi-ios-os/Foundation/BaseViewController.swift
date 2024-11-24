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
        setup()
        bindViewModel()
        bindActions()
    }
    
    func setup() {
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func bindViewModel() {}
    
    func bindActions() {}
    
}
