//
//  TopNav.swift
//  Artspira
//
//  Created by Syed Ahmad  on 25/12/2024.
//

import SwiftUI

struct TopNav: View {
    
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var showBackButton: Bool?
    var body: some View {
        
        topNav
        
    }
}

extension TopNav{
    
    var topNav: some View {
        
        ZStack{
            
            Text(title)
                .font(.semiBold(size: 18))
                .frame(maxWidth: 130)
                .lineLimit(1)
            
            HStack{
                
                if showBackButton ?? true {
                    
                    Button{
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }label: {
                        
                        HStack{
                            Text("Back")
                                .font(.medium(size: 16))
                                .foregroundStyle(Color.primaryBlack)
                            
                            ImageName.arrowBackward
                        }
                    }
                    
                    Spacer()
                    
                }
                
            }
        }
        
    }
}
#Preview {
    TopNav(title: "Hello")
}
