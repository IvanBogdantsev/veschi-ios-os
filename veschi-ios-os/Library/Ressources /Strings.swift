//  veschi-ios-os
//  Created by Ivan B.

enum Strings {
    static let veschi = "Veschi"
    static let search_for_countries_or_codes = "search_for_countries_or_codes".localized()
    static let throw_your_number = "throw_your_number".localized()
    static let to_create_an_account_or_sign_in = "to_create_an_account_or_sign_in".localized()
    static let send = "send".localized()
    
    static func and_num_more(num: Int) -> String {
        let format = "and_%d_more".localized()
        return String(format: format, num)
    }
}
