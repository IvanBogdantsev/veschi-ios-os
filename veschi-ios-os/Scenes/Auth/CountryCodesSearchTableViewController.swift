// veschi-ios-os
// Created by Ivan B.

import UIKit

final class CountryCodesSearchTableViewController: UITableViewController {
    
    private let searchController = UISearchController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemItem: .cancel,
            primaryAction: UIAction { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        searchController.obscuresBackgroundDuringPresentation = true
    }
    
}
