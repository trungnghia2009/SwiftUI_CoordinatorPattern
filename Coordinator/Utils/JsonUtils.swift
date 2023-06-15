// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import Foundation

final class JsonUtils {
    static func getJsonData(name: String) -> Data? {
        guard let path = Bundle.main.path(forResource: name, ofType: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            print("Failed to get json file: \(error)")
            return nil
        }
    }
}
