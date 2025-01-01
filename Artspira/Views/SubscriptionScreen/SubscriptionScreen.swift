//
//  SubscriptionScreen.swift
//  Artspira
//
//  Created by Syed Ahmad  on 31/12/2024.
//

import SwiftUI

struct SubscriptionScreen: View {
    var body: some View {
        screenView
    }
}
extension SubscriptionScreen{
    
    var screenView: some View {
        
        VStack{
            
            ImageName.subscriptionScreenImage
                .resizable()
                .frame(width: 343, height: 333)
            
            header
        }
        
    }
    
}

extension SubscriptionScreen{
    
    var header: some View {
        
        VStack(spacing: 15){
            
            Text("Get Graphics for Artspira Pro")
                .font(.semiBold(size: 20))
            
            Text("Customize & Create all-in-one app")
                .font(.regular(size: 17))
        }
        
    }
    
}

#Preview {
    SubscriptionScreen()
}
