//
//  CategoryTag.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct CategoryTag: View {
    @Binding var isSelected: Bool
    var title : String
    var action : () -> Void
    var body: some View {
        screenView
    }
}

extension CategoryTag{
    
    var screenView: some View {
        
        Button{
            
            self.action()
            
        }label: {
            
            Text(title)
                .font(.regular(size: 14))
                .foregroundStyle(isSelected ? Color.white : Color.primaryBlue)
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(
                    
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(isSelected ? Color.primaryBlue : Color.white)
                        .frame(height: 40)
                    
                )
            
                .addStroke(radius: 8, color: .primaryBlue, lineWidth: 1)
            
            
        }
        
    }
}

#Preview {
    CategoryTag(isSelected: .constant(false), title: "Hello"){
        
    }
}
