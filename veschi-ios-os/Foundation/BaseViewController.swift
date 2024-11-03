//  veschi-ios-os
//  Created by Ivan B.

import RxSwift
import UIKit
// not final
// swiftlint:disable:next final_class
class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindActions()
    }
    
    func bindActions() {}
    
    func bindViewModel() {}
    
}
