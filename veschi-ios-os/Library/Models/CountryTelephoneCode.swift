// veschi-ios-os
// Created by Ivan B.

struct CountryTelephoneCode: Codable {
    let callingCode: Int
    let countryName: String
    let countryCode: String
}

extension CountryTelephoneCode {
    enum CodingKeys: String, CodingKey {
        case callingCode = "calling_code"
        case countryName = "country_name"
        case countryCode = "country_code"
    }
}
