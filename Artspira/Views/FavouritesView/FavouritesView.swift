//
//  Favourites.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct FavouritesView: View {
    
    @ObservedObject var vm = ViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        screenView
            .padding(.horizontal)
            .onAppear(){
                vm.personalizeFavourites = UserDefaultManager.shared.getFavourites()
            }
    }
}

extension FavouritesView{
    
    
    var screenView : some View {
        
        VStack{
            
            Text("Favourites")
                .font(.semiBold(size: 20))
            
            if vm.personalizeFavourites.isEmpty{
                
                placeholder
                
            } else {
                
                items
            }
            
            
        }
        
    }
    
}

extension FavouritesView{
    
    var items: some View {
        
        ScrollView(showsIndicators: false){
            
            LazyVGrid(columns: columns, spacing: 16) {
                
                ForEach(vm.personalizeFavourites, id: \.self) { fileName in

                        
                        NavigationLink{
                            
                            EditSVGView(fileName: fileName)
                                .navigationBarBackButtonHidden()
                            
                        }label: {
                            
                            ZStack(alignment: .topTrailing){
                                
                                SVGParser(imageName: fileName)
                                    .frame(width: 173, height: 169)
                                    .clipped()
                                    .clipShape(.rect)
                                    .cornerRadius(8, corners: .allCorners)
                                    .addStroke(radius: 8, color: .lightGray, lineWidth: 1)
                                
                                if vm.personalizeFavourites.contains(fileName){
                                    
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                        .foregroundStyle(Color.primaryBlue)
                                        .padding()
                                        .onTapGesture {
                                            vm.personalizeFavourites.removeAll(where: {$0 == fileName})
                                            UserDefaultManager.shared.setFavourites(favourites: vm.personalizeFavourites)
                                        }
                                    
                                }
                            }
                            
                    }
     
                    
                }
            }
        }
        
    }
    
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
