//
//  UserFQAScreen.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import SwiftUI

struct UserFQAScreen: View {
    @StateObject var viewModel: UserFQAViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 30) {
            Text("This is FQA")
            Button("Close") {
                dismiss()
            }
        }
    }
}
