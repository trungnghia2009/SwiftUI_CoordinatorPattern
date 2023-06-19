//
//  UserLocationSelectionViewModel.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import Factory
import SwiftUI

class UserLocationSelectionViewModel: ObservableObject {
    @Published var regionList: [String] = []
    @Published var selectedCountryName: String? = "" {
        didSet {
            guard let selectedCountryName = selectedCountryName else {
                return
            }
            saveLocation(for: selectedCountryName)
        }
    }

    private let userService: UserService

    init(userService: UserService = DefaultUserService()) {
        self.userService = userService
    }

    private var selectedCountryCode: String = ""
    private var dataSource: [String: [String]] = [:]
    private typealias TransfomedData = ([String: [String]], [String])

    func fetchLocationData() {
        Task {
            do {
                let userLocations = try await userService.fetchLocation()
                let transfomedData = convertData(locations: userLocations)
                dataSource = transfomedData.0
                await MainActor.run {
                    regionList = transfomedData.1
                }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }

    func getCountryList(for region: String) -> [String] {
        return dataSource[region] ?? []
    }

    private func convertData(locations: [ContinentEntity]) -> TransfomedData {
        var userLocations: [String: [String]] = [:]
        var regions: [String] = []

        locations.forEach { location in
            regions.append(location.regionName)
            let countries: [String] = location.countries.map { $0.name }
            userLocations[location.regionName] = countries
        }

        return (userLocations, regions.sorted { $0 < $1 })
    }

    private func saveLocation(for country: String) {
        print("Selected country: \(country)")
        // Perform storage saving
    }


}
