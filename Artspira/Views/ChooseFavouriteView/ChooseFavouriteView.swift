//
//  ChooseFavouriteView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 23/12/2024.
//

import SwiftUI
import Macaw

struct ChooseFavouriteView: View {
    @State var moveNext = false
    @State var images = []
    
    var body: some View {
        screenView
            .navigationDestination(isPresented: $moveNext, destination: {
                
                TabBar()
                    .navigationBarBackButtonHidden()
                
            })
            .onAppear(){
                
                self.loadImages()
                
            }
    }
}

extension ChooseFavouriteView{
    
    var screenView: some View {
        
        VStack(alignment: .leading, spacing: 5){
            
            
            Text("Choose 3-5 of your favorite")
                .font(.semiBold(size: 24))
            
            Text("graphics you see:")
                .font(.semiBold(size: 24))
            
            imageCell(path: images.first as? String ?? "") {
                
            }
            
            Button{
                self.moveNext = true
            }label: {
                Text("Dds")
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
    
    func loadImages() {

        self.images = Bundle.main.paths(forResourcesOfType: "svg", inDirectory: nil)
//        debugPrint(images.count)
        debugPrint(images)
////        self.images.first = self.images.first
////
//        if let resourceURL = Bundle.main.resourceURL {
//            print("Resource URL: \(resourceURL.path)")
//        }
        
        if let svgPath = Bundle.main.path(forResource: "example", ofType: "svg", inDirectory: nil) {
            print("SVG found at path: \(svgPath)")
        } else {
            print("SVG not found")
        }
    }
    
}

#Preview {
    ChooseFavouriteView()
}
