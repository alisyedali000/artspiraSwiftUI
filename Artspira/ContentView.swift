//
//  ContentView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(UserDefaultEnum.splashStatus.rawValue) var isSplashShown = UserDefaultManager.shared.isSplashShown()
    
    var body: some View {
        Group {
            
            if isSplashShown{
                
                TabBar()
                    .navigationBarBackButtonHidden()
       
                
            } else {
                
                SplashView()
                
            }
            
            
        }
        .onAppear(){
            
            if let projectPath = Bundle.main.resourcePath?.appending("/AllGraphics") {
                CategoryManager.shared.fetchAllGraphics(from: projectPath, to: &CategoryManager.shared.categories)
                
                for (category, files) in CategoryManager.shared.categories {
                    debugPrint("Category: \(category)")
                    for file in files {
                        debugPrint("  File: \(file)")
                    }
                }
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
