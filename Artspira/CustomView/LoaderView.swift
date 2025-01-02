//
//  LoaderView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 02/01/2025.
//

import SwiftUI

struct LoaderView: View {
    @Binding var isLoading: Bool
    var body: some View {
        screenView
    }
}


extension LoaderView{
    
    var screenView: some View {
        
        ZStack{
            
            if isLoading{
                
                Rectangle()
                    .foregroundStyle(Color.black.opacity(0.1))
                    .ignoresSafeArea()
                
                ProgressView()
                    .scaleEffect(1)
                
            }
        }
        
    }
    
}
#Preview {
    LoaderView(isLoading: .constant(true))
}
