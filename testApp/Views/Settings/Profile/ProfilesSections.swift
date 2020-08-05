//
//  ProfilesSections.swift
//  testApp
//
//  Created by Dev on 7/24/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import Foundation

enum ProfileSection : Int, CaseIterable, CustomStringConvertible {
    
    case Fotos
    case AboutMe
    case Name
    case Gender
    case SexualOrientation
    case Age
    case Interests
    case MyLocation
    case ControlProfile
    
    var description: String {
        switch self {
        case .Fotos: return "Fotos"
        case .AboutMe: return "About Me"
        case .Name: return "Name"
        case .Gender: return "Gender"
        case .SexualOrientation: return "Sexual Orientation"
        case .Age: return "Age"
        case .Interests: return "Interests"
        case .MyLocation: return "My Location"
        case .ControlProfile: return "Control Profile"
        }
    }
}
