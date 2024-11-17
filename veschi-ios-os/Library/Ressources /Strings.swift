//  veschi-ios-os
//  Created by Ivan B.

enum Strings {
    static let veschi = "Veschi"
    static let search_for_countries_or_codes = "search_for_countries_or_codes".localized()
    
    static func and_num_more(num: Int) -> String {
        let format = "and_%d_more".localized()
        return String(format: format, num)
    }
}
