//
//  SearchView.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var vm = ViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        screenView
            .onAppear(){
                vm.getRandomCategoryNames()
            }
            .padding(.horizontal)
            .onChange(of: vm.searchText) {

                vm.searchFromCategories()

                
            }
    }
}

extension SearchView{
    
    var screenView: some View {
        
        VStack{
            
            TopNav(title: "Search", showBackButton: false)
            
            searchField
                .padding(.bottom)
            
            if vm.searchResults.isEmpty{
                
                randomCategories
                
                Spacer()
                
            } else {
                
                items
                
            }
        }
        
    }
    
}

extension SearchView{
    
    var searchField: some View {
        
        HStack{
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundStyle(Color.gray)
                .padding(.leading)
            
            TextField("Search", text: $vm.searchText)
                .font(.regular(size: 16))
                .padding(15)
                .padding(.trailing,25)
            
            Spacer()
            
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundStyle(Color.gray)
                .padding(.trailing)
                .onTapGesture {
                    vm.searchText = ""
                    vm.searchResults.removeAll()
                }
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(.lightGray).opacity(0.05))
            
        )
        .addStroke(radius: 12, color: .lightGray, lineWidth: 1)
        
    }
    
    
    var items: some View {
        
        ScrollView(showsIndicators: false){
            
            LazyVGrid(columns: columns, spacing: 16) {
                
                ForEach(vm.searchResults, id: \.self){ fileName in
                    
                    NavigationLink{
                        
                        EditSVGView(fileName: fileName)
                            .navigationBarBackButtonHidden()
                        
                    }label:{
                        
                        SVGParser(imageName: fileName)
                            .frame(width: 173, height: 169)
                            .cornerRadius(8, corners: .allCorners)
                            .addStroke(radius: 8, color: .lightGray, lineWidth: 1)
                    }
                    
                }
            }
        }
        
    }
    
    var randomCategories: some View {
        
        VStack(spacing : 15){
            
            ForEach(vm.randomCategoriesNames, id: \.self){ category in
                
                
                
                Text(category)
                    .font(.semiBold(size: 17))
                    .foregroundStyle(Color.primaryBlue)
                    .onTapGesture {
                        //                                vm.searchText = category
                        vm.searchCategories(categoryName: category)
                    }
                
            }
            
        }
        
    }
}

#Preview {
    SearchView()
}
