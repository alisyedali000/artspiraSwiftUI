//
//  ViewModifiers.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import Foundation
import SwiftUI
import StoreKit

extension View {
    
    var addBackground: some View {
        modifier(Background())
    }
    
    var addRoundedBackground: some View {
        modifier(AddRoundedBackground())
    }
    
    func addStroke(radius: CGFloat, color : Color, lineWidth: CGFloat) -> some View {
        modifier(AddStroke(radius: radius, color: color, lineWidth: lineWidth))
    }
}

struct Background: ViewModifier {
    
    func body(content: Content) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundStyle(Color.tabBarBlue)
                .ignoresSafeArea(.all)
            
            content
        }
    }
}



struct AddRoundedBackground : ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: horizontalSizeClass == .compact ? 21 : 56.8)
                    .foregroundStyle(Color.tabBarBlue)
            )
            
    }
}

struct AddStroke : ViewModifier {
    
    var radius: CGFloat
    var color: Color
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color, lineWidth: lineWidth)
            }
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



