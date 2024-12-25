//
//  Colors.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    
    static var primaryBlue: Color {
        
        Color(hex: "#3C62DE")
    }
    
    static var lightBlue: Color {
        
        Color(hex: "#617DF4")
    }
    
    static var tabBarBlue: Color {
        
        Color(hex: "#3955EB")
    }
    
    static var lightGray: Color {
        
        Color(hex: "#D0D1D1")
    }
    
    static var tabBarUnselected: Color {
        
        Color(hex: "#91A4F3")
    }
    
    static var primaryBlack: Color {
        
        Color(hex: "#141B34")
    }
    
}
