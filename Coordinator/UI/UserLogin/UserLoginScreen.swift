//
//  UserLoginScreen.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import SwiftUI

struct UserLoginScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: UserLoginViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text("This my login screen")
            Button {
                coordinator.present(sheet: .userFQA)
            } label: {
                Label("present FQA", systemImage: "square.and.arrow.up")
            }

            Button {
                coordinator.present(fullScreenCover: .userFQA)
            } label: {
                Label("Cover FQA", systemImage: "pencil.tip")
            }

            Button {
                coordinator.push(screen: .userLocationSelection)
            } label: {
                Label("Navigate to Location Selection", systemImage: "lasso")
            }

            Button {
                coordinator.pop()
            } label: {
                Label("Pop to lastest view", systemImage: "arrowshape.turn.up.backward")
            }


        }
        .toolbar {
            // Location button --> go to Location Selection
            NavigationLink(value: Screen.userLocationSelection) {
                Image(systemName: "location.fill.viewfinder")
            }

            // Setting button --> go to Settings
            NavigationLink(value: Screen.userSetting) {
                Image(systemName: "gearshape")
            }

        }
        .navigationTitle("Login")
    }

}
