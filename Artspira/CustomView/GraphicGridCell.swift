//
//  GraphicGridCell.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct GraphicGridCell: View {
    
    var title : String
    var bgColor: Color
    var imageName: String
    
    var body: some View {
        screenView
    }
}

extension GraphicGridCell{
    
    var screenView : some View {
        
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 173, height: 169)
            .foregroundStyle(bgColor)
            .overlay {
                
                VStack(alignment: .leading){
                    
                    Text(title)
                        .font(.semiBold(size: 16))
                        .foregroundStyle(Color.black)
                        .padding(.vertical)
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 120, height: 120)
                            .foregroundStyle(Color.white)
                            .opacity(0.5)
                        
                        SVGParser(imageName: imageName)
                            .frame(width: 120, height: 120)
                            .cornerRadius(12, corners: .allCorners)
                        
                    }
                    .rotationEffect(Angle(degrees: 8))
                    .offset(x: -10, y: 20)
                }
                
                
            }
            .clipped()
            .clipShape(.rect)
        
        
        
    }
}

#Preview {
    GraphicGridCell(title: "Christmas", bgColor: .lightGray, imageName: "BabyItsColdOutside")
}
