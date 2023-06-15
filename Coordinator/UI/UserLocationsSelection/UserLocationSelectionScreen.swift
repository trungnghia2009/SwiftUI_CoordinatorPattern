// Copyright (c) 2023 Bosch. All rights reserved
// Created 2023

import SwiftUI

struct UserLocationSelectionScreen: View {
    @StateObject var viewModel: UserLocationSelectionViewModel

    init(viewModel: UserLocationSelectionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(Constants.UserLocationsSelection.text1)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 4))

            if viewModel.regionList.isEmpty {
                VStack {
                    Spacer()
                    ProgressView {
                        Text(Constants.UserLocationsSelection.text3)
                    }
                    Spacer()
                }
            } else {
                locationSelectionView
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(Constants.UserLocationsSelection.text2)
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            viewModel.fetchLocationData()
        }
    }

    private var locationSelectionView: some View {
        List(viewModel.regionList, id: \.self, selection: $viewModel.selectedCountryName) { region in
            Section {
                ForEach(viewModel.getCountryList(for: region), id: \.self) { country in
                    NavigationLink(value: Screen.userLogin) {
                        Text(country)
                    }
                }
            } header: {
                Text(region)
            }
        }
        .listStyle(.grouped)
    }
}
