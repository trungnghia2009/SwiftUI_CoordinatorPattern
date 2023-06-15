//
//  UserSettingsScreen.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import SwiftUI

struct UserSettingsScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: UserSettingsViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text("This is awsome Settings page!!!")
            Button {
                coordinator.popToRoot()
            } label: {
                Text("Pop to root view")
            }
        }
    }
}
