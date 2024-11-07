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
        basicSetup()
        bindViewModel()
        bindActions()
    }
    
    func basicSetup() {}
    
    func bindViewModel() {}
    
    func bindActions() {}
        
}
