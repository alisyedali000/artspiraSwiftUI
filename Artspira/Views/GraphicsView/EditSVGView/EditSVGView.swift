//
//  EditSVGView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 21/12/2024.
//

import SwiftUI

struct EditSVGView: View {
    
    @State var graphicColors : [Color] = [.red, .green, .blue, .gray, .brown]
    @State var bgColors : [Color] = [.lightBlue, .red, .gray, .yellow, .teal]
    @State var newColor : Color = .white
    @State var color : Color = .white
    @State var bgColor : Color = .white
    
    @State private var scale: CGFloat = 1.0 // Scale factor for pinch-to-zoom
    @State private var offset: CGSize = .zero

    var fileName: String
    var body: some View {
        screenView
            .padding(.horizontal)
            .onChange(of: newColor) {
                
                if !self.graphicColors.contains(newColor){
                    self.graphicColors.append(newColor)
                    
                }
                
                self.color = newColor
            }
            .onChange(of: bgColor) {
                
                if !self.bgColors.contains(bgColor){
                    self.bgColors.append(bgColor)
                    
                }
            }
    }
}

extension EditSVGView{
    
    var screenView: some View {
        
        VStack{
            
            TopNav(title: fileName.capitalized)
            
            ScrollView{
                
                VStack(spacing: 20){
                    
                    SVGViewControllerWrapper(imageName: fileName, nodeColor: $color, bgColor: $bgColor)
                        .frame(width: 259, height: 253)
                        .cornerRadius(12, corners: .allCorners)
                        .addStroke(radius: 12, color: .lightGray, lineWidth: 1)
                    
                    Spacer()
                    
                    customizeBackground
                    
                    customizeGraphics
                    
                    adjustSizing
                    
                }
                
            }
        }
        
    }
    
}

extension EditSVGView{
    
    var customizeBackground: some View {
        
        VStack(alignment: .leading){
            
            Text("Customize Background:")
                .font(.semiBold(size: 14))
            
       
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    ZStack{
                        
                        ColorPicker("", selection: $bgColor)
                            .background(
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 48, height: 48)
                                    .foregroundStyle(.white)
                                    .addStroke(radius: 8, color: .lightGray, lineWidth: 2)
                            )
                            .labelsHidden()
                            .padding(.horizontal, 10)
                            
                    }
                    
                    ForEach(bgColors.reversed(), id: \.self){ color in
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 48, height: 48)
                            .foregroundStyle(color)
                            .addStroke(radius: 8, color: .blue, lineWidth: self.bgColor == color ? 4 : 0)
                            .padding(.vertical, 10)
                            .onTapGesture {
                                self.bgColor = color
                            }
                        
                    }
                }
            }
            
        }
    }
    
    var customizeGraphics: some View {
        
        VStack(alignment: .leading){
            
            Text("Customize Graphics:")
                .font(.semiBold(size: 14))
            
       
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    ZStack{
                        
                        ColorPicker("", selection: $newColor)
                            .background(
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 48, height: 48)
                                    .foregroundStyle(.white)
                                    .addStroke(radius: 8, color: .lightGray, lineWidth: 2)
                            )
                            .labelsHidden()
                            .padding(.horizontal, 10)
                    }
                    
                    ForEach(graphicColors.reversed(), id: \.self){ color in
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 48, height: 48)
                            .foregroundStyle(color)
                            .addStroke(radius: 8, color: .blue, lineWidth: self.color == color ? 4 : 0)
                            .onTapGesture {
                                self.color = color
                            }
                            .padding(.vertical, 10)
                        
                    }
                }
            }
            
        }
    }
    
    var adjustSizing: some View{
        
        VStack(alignment: .leading){
            
            Text("Adjust Sizing:")
                .font(.semiBold(size: 14))
            
            
        }
        
    }
    
}

#Preview {
    EditSVGView(fileName: "BabyItsColdOutside")
}
