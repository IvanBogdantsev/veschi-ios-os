// veschi-ios-os
// Created by Ivan B.

import UIKit

// not final
// swiftlint:disable:next final_class
class BaseTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableView.tintColor = Colors.accent
    }
    
}
