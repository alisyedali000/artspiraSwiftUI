//
//  ChooseFavouriteView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 23/12/2024.
//

import SwiftUI
import Macaw

struct ChooseFavouriteView: View {
    
    @ObservedObject var vm : ViewModel
    @State var moveNext = false
    
    let columns = [
         GridItem(.flexible()),
         GridItem(.flexible())
     ]
    
    var body: some View {
        screenView
            .onAppear(){
                vm.selectedCategories = ["Christmas"] // Uncomment for Preview
                vm.fetchSuggestedGraphics()
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $moveNext, destination: {
                
                TabBar()
                    .navigationBarBackButtonHidden()
                
            })

    }
}

extension ChooseFavouriteView{
    
    var screenView: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            VStack(alignment: .leading){
                
                Text("Choose 3-5 of your favorite")
                    .font(.semiBold(size: 24))
                
                Text("graphics you see:")
                    .font(.semiBold(size: 24))
            }
            
            ScrollView(showsIndicators: false) {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(vm.suggestedGraphics, id: \.self) { fileName in
                        
                        ZStack(alignment: .topTrailing){
                            
                            SVGParser(imageName: fileName)
                                .frame(width: 173, height: 169)
                                .addStroke(radius: 8, color: vm.personalizeFavourites.contains(fileName) ? .primaryBlue : .gray.opacity(0.4), lineWidth: vm.personalizeFavourites.contains(fileName) ? 2 : 1)
                            
                            if vm.personalizeFavourites.contains(fileName){
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(Color.primaryBlue)
                                    .padding()
                            }
                            
                        }
                        .onTapGesture {
                            
                            if vm.personalizeFavourites.contains(fileName){
                                
                                vm.personalizeFavourites.removeAll(where: {$0 == fileName})
                                
                            } else {
                                
                                vm.personalizeFavourites.append(fileName)
                                
                            }
                        }
                        
                    }
                }
                
            }
            
            AppButton(title: "Continue") {
                
                vm.addFavourties(){
                    
                    self.moveNext.toggle()
                    
                }
            }
        }
        
        
    }
    
}

extension ChooseFavouriteView{
    
    func imageCell(path: String, action : @escaping () -> Void) -> some View{
        
        SVGParser(imageName: path)
            .frame(width: 200, height: 200)
    }
    
}

extension ChooseFavouriteView{
    

    
}

#Preview {
    ChooseFavouriteView(vm: ViewModel())
}
