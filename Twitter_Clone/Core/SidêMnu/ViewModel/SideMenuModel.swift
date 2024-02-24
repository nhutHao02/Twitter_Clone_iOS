//
//  SideMenuModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 17/02/2024.
//

import Foundation

enum SideMenuModel:Int, CaseIterable{
    case profile
    case lists
    case bookmarks
    case logout
    
    var description:String{
        switch self {
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookmarks:
            return "Bookmarks"
        case .logout:
            return "Log out"
        }
    }
    
    var iconNameSystem:String{
        switch self {
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        }
    }
}
