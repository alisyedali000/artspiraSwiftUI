//
//  GraphicsView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct GraphicsView: View {
    @ObservedObject var categories = CategoryManager.shared
    let columns = [
         GridItem(.flexible()),
         GridItem(.flexible())
     ]

    
    var body: some View {
        
        screenView
            .padding(.horizontal)
        
    }
}

extension GraphicsView{
    
    var screenView : some View {
        
        VStack{
            
            TopNav(title: "Graphics", showBackButton: false)
            
            ScrollView(showsIndicators: false) {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(categories.categories.keys.sorted(), id: \.self) { category in
                        
                        NavigationLink{
                            
                            CategoryView(selectedCategory: category)
                                .navigationBarBackButtonHidden()
                            
                        }label: {
                            
                            GraphicGridCell(
                                title: category.capitalized,
                                bgColor: Color(hex: "#D8E0FB"),
                                imageName: "\(categories.categories[category]?.first ?? "")"
                            )
                        }
                        
                    }
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    GraphicsView()
}
