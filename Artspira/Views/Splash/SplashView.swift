//
//  SplashView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct SplashView: View {
    @State var moveNext = false
    @StateObject var vm = ViewModel()
    var body: some View {
        screenView
            .onAppear(){
                
                if let projectPath = Bundle.main.resourcePath?.appending("/AllGraphics") {
                    vm.fetchAllGraphics(from: projectPath, to: &categories)
                    
                    for (category, files) in categories {
                        debugPrint("Category: \(category)")
                        for file in files {
                            debugPrint("  File: \(file)")
                        }
                    }
                }

                
            }
            .navigationDestination(isPresented: $moveNext) {
                
                PersonalizeView()
                    .navigationBarBackButtonHidden()
                
            }
    }
}

extension SplashView{
    
    var screenView: some View{
        
        ZStack(alignment: .bottom){
            
            ImageName.splashImage
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            AppButton(title: "Begin Setup") {
                self.moveNext.toggle()
            }
            .padding(.horizontal)
            .padding(.bottom,70)
            
        
            
        }
        
    }
    
}

#Preview {
    SplashView()
}
