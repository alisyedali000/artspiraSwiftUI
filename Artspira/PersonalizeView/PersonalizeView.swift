//
//  PersonalizeView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//


import Foundation
import SwiftUI

struct PersonalizeView: View {
    
    @StateObject var vm = ViewModel()
    
    @State var moveNext = false
    
    @State private var totalHeight = CGFloat.zero // For dynamic height adjustment
    
    var body: some View {
        
        screenView
            .padding(.horizontal)
            .navigationDestination(isPresented: $moveNext) {
                
                ChooseFavouriteView(vm: self.vm)
                    .navigationBarBackButtonHidden()
                
                
            }
        
    }
    
    
}
extension PersonalizeView{
    
    var screenView: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            VStack(alignment : .leading, spacing: 10){
                
                Text("Personalize")
                    .font(.semiBold(size: 24))
                
                Text("Select the categories that most interest you")
                    .font(.regular(size: 16))
            }
            
            tagsView
            
            Spacer()
            
            AppButton(title: "Continue") {
                if !vm.selectedCategories.isEmpty{
                    self.moveNext.toggle()
                }
            }
            
        }
    }
    
}
extension PersonalizeView{
    
    var tagsView: some View {
        
        VStack {
            GeometryReader{ geo in
                
                
                self.generateContent(in: geo)
            }
        }
        .frame(height: totalHeight)
        
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(vm.personalizeTags, id: \.self) { tag in
                CategoryTag(
                    isSelected: Binding(
                        get: { vm.selectedCategories.contains(tag) },
                        set: { _ in } // Do nothing since action handles the updates
                    ),
                    title: tag,
                    action: {
                        if vm.selectedCategories.contains(tag){
                            vm.selectedCategories.removeAll(where: {$0 == tag}) // Use the provided action for add/remove
                        } else {
                            vm.selectedCategories.append(tag)
                        }
                    }
                )
                .padding(.trailing, 7)
                .padding(.vertical, 5)
                .alignmentGuide(.leading, computeValue: { d in
                    if abs(width - d.width) > g.size.width {
                        width = 0
                        height -= d.height
                    }
                    let result = width
                    if tag == self.vm.personalizeTags.last {
                        width = 0 // last item
                    } else {
                        width -= d.width
                    }
                    return result
                })
                .alignmentGuide(.top, computeValue: { _ in
                    let result = height
                    if tag == vm.personalizeTags.last {
                        height = 0 // Reset for the last item
                    }
                    return result
                })
            }
        }
        .background(viewHeightReader($totalHeight)) // Capture the dynamic height
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geometry.size.height
            }
            return .clear
        }
    }
}
#Preview{
    PersonalizeView()
}
