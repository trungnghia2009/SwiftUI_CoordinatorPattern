// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import Foundation

struct ContinentEntity {
    let regionName: String
    let countries: [Country]

    struct Country {
        let languageCode: String
        let name: String
    }
}
