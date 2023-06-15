//
//  UserService.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import Foundation

enum NetworkUserLocationsError: Error {
    case error(String)
}

protocol UserService: AnyObject {
    func fetchLocation() async throws -> [ContinentEntity]
}

final class DefaultUserService: UserService {
    func fetchLocation() async throws -> [ContinentEntity] {
        guard let data = JsonUtils.getJsonData(name: "LocationMock") else {
            throw NetworkUserLocationsError.error("Cannot find json file")
        }

        sleep(1)

        let continents = try JSONDecoder().decode([ContinentDTO].self, from: data)
        return continents.map { $0.convertToContinentEntity() }
    }


}
