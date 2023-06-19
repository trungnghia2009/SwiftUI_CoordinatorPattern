//
//  Coordinator.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import SwiftUI
import Factory

enum Screen: Identifiable {
    case userLocationSelection
    case userLogin
    case userSetting
    case userFQA

    var id: String { String(describing: self) }
}

enum Sheet: Identifiable {
    case userFQA

    var id: String { String(describing: self) }
}

enum FullScreenCover: Identifiable {
    case userFQA

    var id: String { String(describing: self) }
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var screen: Screen = .userLocationSelection
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    // MARK: - Navigation strigger
    func push(screen: Screen) {
        switch screen {
        case .userLocationSelection:
            path.append(Screen.userLocationSelection)
        case .userLogin:
            path.append(Screen.userLogin)
        case .userSetting:
            path.append(Screen.userSetting)
        case .userFQA:
            path.append(Screen.userFQA)
        }
    }

    func popToRoot() {
        path = .init()
    }

    func pop() {
        path.removeLast()
    }

    // MARK: - Presentation trigger
    func present(sheet: Sheet) {
        switch sheet {
        case .userFQA:
            self.sheet = .userFQA
        }
    }

    func present(fullScreenCover: FullScreenCover) {
        switch fullScreenCover {
        case .userFQA:
            self.fullScreenCover = .userFQA
        }
    }

    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .userLocationSelection:
            let viewModel = UserLocationSelectionViewModel(userService: Container.shared.userService())
            UserLocationSelectionScreen(viewModel: viewModel)
        case .userLogin:
            let viewModel = UserLoginViewModel()
            UserLoginScreen(viewModel: viewModel)
        case .userSetting:
            let viewModel = UserSettingsViewModel()
            UserSettingsScreen(viewModel: viewModel)
        case .userFQA:
            let viewModel = UserFQAViewModel()
            UserFQAScreen(viewModel: viewModel)
        }
    }

    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .userFQA:
            let viewModel = UserFQAViewModel()
            UserFQAScreen(viewModel: viewModel)
        }
    }

    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .userFQA:
            let viewModel = UserFQAViewModel()
            UserFQAScreen(viewModel: viewModel)
        }
    }

}
