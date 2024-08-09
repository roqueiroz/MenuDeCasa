//
//  SideMenuViewModel.swift
//  MenuDeCasa
//
//  Created by Rodrigo Queiroz on 09/08/24.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case notifications
    case messages
    case logout
    
    var title: String {
        switch self {
            case .profile:
                return "Profile"
            case .notifications:
                return "Notifications"
            case .messages:
                return "Messages"
            case .logout:
                return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .profile:
                return "person"
            case .notifications:
                return "bell"
            case .messages:
                return "bubble.left"
            case .logout:
                return "arrow.left.square"
        }
    }
}

extension SideMenuViewModel: Identifiable {
    var id: Int { return self.rawValue }
}
