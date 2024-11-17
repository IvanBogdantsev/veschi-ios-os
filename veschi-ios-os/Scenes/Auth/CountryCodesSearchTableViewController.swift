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
    
    private var filteredDataSource: [(zone: String, countries: [CountryDialingCode])] = []
    private var isSearching: Bool {
        !(searchController.searchBar.text?.isEmpty ?? true)
    }
    
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
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.keyboardType = .asciiCapable
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemItem: .cancel,
            primaryAction: UIAction { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = Strings.search_for_countries_or_codes
        tableView.tintColor = Colors.accent
    }
}

extension CountryCodesSearchTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        isSearching ? filteredDataSource.count : groupedDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let source = isSearching ? filteredDataSource : groupedDataSource
        return source[section].countries.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let source = isSearching ? filteredDataSource : groupedDataSource
        return source[section].zone
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        let source = isSearching ? filteredDataSource : groupedDataSource
        let country = source[indexPath.section].countries[indexPath.row]
        cell.textLabel?.text = "\(country.ISOCode.asEmojiFlag) \(country.countryName) +\(country.dialingCode)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = isSearching ? filteredDataSource : groupedDataSource
        let country = source[indexPath.section].countries[indexPath.row]
        onSelection?(country)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let source = isSearching ? filteredDataSource : groupedDataSource
        return source.map { $0.zone }
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        index
    }
}

extension CountryCodesSearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text?.lowercased(), !query.isEmpty else {
            filteredDataSource = []
            tableView.reloadData()
            return
        }
        filteredDataSource = groupedDataSource.compactMap { section in
            let filteredCountries = section.countries.filter {
                $0.countryName.lowercased().contains(query) ||
                $0.ISOCode.lowercased().starts(with: query) ||
                "\($0.dialingCode)".starts(with: query.trimmingCharacters(in: CharacterSet(charactersIn: "+")))
            }
            return filteredCountries.isEmpty ? nil : (section.zone, filteredCountries)
        }
        tableView.reloadData()
    }
}

fileprivate extension UITableViewCell {
    static var identifier: String {
        return String(describing: type(of: self))
    }
}
