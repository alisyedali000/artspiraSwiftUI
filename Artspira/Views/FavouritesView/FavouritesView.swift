//
//  Favourites.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct FavouritesView: View {
    
    
    
    var body: some View {
        screenView
    }
}

extension FavouritesView{
    

    var screenView : some View {
        
        VStack{
            
            Text("Favourites")
                .font(.semiBold(size: 20))
            
            placeholder
            
        
            
        }
        
    }
    
}

extension FavouritesView{
    
    var placeholder: some View {
        
        VStack{
            
            Spacer()
            
            ImageName.emptyStatePlaceHolder
            
            VStack(spacing: 10){
                
                Text("Nothing here yet!")
                    .font(.semiBold(size: 20))
                Text("Tap the heart to add to favorites.")
                    .foregroundStyle(Color.lightGray)
                    .font(.regular(size: 16))
            }
            
            Spacer()
        }
        
    }
    
}

#Preview {
    FavouritesView()
}
