//
//  AppButton.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct AppButton: View {
    var title : String
    var action : () -> Void
    var body: some View {
        screenView
    }
}

extension AppButton{
    
    var screenView: some View {
        
        Button{
            
            self.action()
            
        }label: {
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.primaryBlue)
                .frame(height: 60)
                .overlay {
                    Text(title)
                        .font(.semiBold(size: 20))
                        .foregroundStyle(Color.white)
                }
            
            
        }
        
    }
}

#Preview {
    AppButton(title: "Hello"){
        
    }
}
