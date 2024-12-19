//
//  GraphicsView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct GraphicsView: View {
    
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
            
            Text("Graphics")
                .font(.semiBold(size: 20))
            
            ScrollView(showsIndicators: false) {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(0..<10) { _ in
                        
                        GraphicGridCell(
                            title: "Christmas",
                            bgColor: .lightGray,
                            image: Image(systemName: "trash.slash.fill")
                            
                        )
                    }
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    GraphicsView()
}
