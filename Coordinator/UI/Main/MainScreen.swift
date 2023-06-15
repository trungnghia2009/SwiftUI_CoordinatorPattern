//
//  MainScreen.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import SwiftUI
import Factory

struct MainScreen: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.userLocationSelection)
                .sheet(item: $coordinator.sheet, content: coordinator.build)
                .fullScreenCover(item: $coordinator.fullScreenCover, content: coordinator.build)
                .navigationDestination(for: Screen.self, destination: coordinator.build)
        }
        .environmentObject(coordinator)
    }
}
