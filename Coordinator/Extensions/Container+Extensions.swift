//
//  Container+Extensions.swift
//  Coordinator
//
//  Created by trungnghia on 14/06/2023.
//

import Factory
import SwiftUI

extension Container {
    var userService: Factory<UserService> {
        Factory(self) { DefaultUserService() }
    }
}
