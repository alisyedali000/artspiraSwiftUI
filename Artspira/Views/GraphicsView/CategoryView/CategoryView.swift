//
//  CategoryView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 24/12/2024.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    var selectedCategory : String
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        screenView
            .padding(.horizontal)
        
        
    }
}

extension CategoryView{
    
    var screenView : some View {
        
        VStack{
            
            TopNav(title: selectedCategory)
            
            ScrollView {
                
                if let filenames = categories[selectedCategory] {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filenames, id: \.self) { filename in
                                
                                NavigationLink{
                                    
                                    EditSVGView(fileName: filename)
                                        .navigationBarBackButtonHidden()
                                    
                                }label: {
                                    
                                    SVGParser(imageName: filename)
                                    
                                        .frame(width: 173, height: 169)
                                        .cornerRadius(8)
                                        .addStroke(radius: 8, color: .gray.opacity(0.4), lineWidth: 1)
                                    
                                }
                            }
                        }
                        
                    }
                    .padding(.bottom)
                }
                
            }
            
        }
    }
    
}

#Preview {
    CategoryView(selectedCategory: "Christmas")
}
