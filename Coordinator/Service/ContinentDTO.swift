// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import Foundation

struct ContinentDTO: Decodable {
    let regionId: Int
    let regionName: String
    let countries: [Country]

    struct Country: Decodable {
        let isoCode: String
        let name: String
        let legalEntityCountryIsoCode: String
    }

    func convertToContinentEntity() -> ContinentEntity {
        .init(regionName: regionName,
              countries: countries.map { ContinentEntity.Country(languageCode: $0.isoCode, name: $0.name) })
    }
}
