// veschi-ios-os
// Created by Ivan B.

import PhoneNumberKit
import UIKit

// this class is entirely written by chatGPT. Looks ugly, but works great
final class CountryCodesSearchTableViewController: UITableViewController {
    
    var onSelection: ((CountryDialingCode) -> Void)?
    
    private let searchController = UISearchController()
    private let phoneNumberUtility = PhoneNumberUtility()
    
    private lazy var dataSource: [CountryDialingCode] = {
        phoneNumberUtility.allCountries()
            .map { ISOCode in
                CountryDialingCode(
                    dialingCode: phoneNumberUtility.countryCode(for: ISOCode) ?? 0,
                    countryName: Environment.locale.localizedString(forRegionCode: ISOCode) ?? "",
                    ISOCode: ISOCode
                )
            }
            .sorted { $0.dialingCode < $1.dialingCode }
    }()
    
    private lazy var groupedDataSource: [(zone: String, countries: [CountryDialingCode])] = {
        let grouped = Dictionary(grouping: dataSource) { country in
            String(country.dialingCode.description.prefix(1))
        }
        return grouped
            .map { key, value -> (zone: String, countries: [CountryDialingCode]) in
                (zone: "+\(key)xx", countries: value.sorted { $0.dialingCode < $1.dialingCode })
            }
            .sorted { $0.zone < $1.zone }
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: UITableViewCell.identifier
        )
    }
    
    private func setup() {
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemItem: .cancel,
            primaryAction: UIAction { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        searchController.obscuresBackgroundDuringPresentation = true
        tableView.tintColor = Colors.accent
    }
}

extension CountryCodesSearchTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        groupedDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupedDataSource[section].countries.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        groupedDataSource[section].zone
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        let country = groupedDataSource[indexPath.section].countries[indexPath.row]
        cell.textLabel?.text = "\(country.ISOCode.asEmojiFlag) \(country.countryName) +\(country.dialingCode)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = groupedDataSource[indexPath.section].countries[indexPath.row]
        onSelection?(country)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        groupedDataSource.map { $0.zone }
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        index
    }
}

fileprivate extension UITableViewCell {
    static var identifier: String {
        return String(describing: type(of: self))
    }
}
