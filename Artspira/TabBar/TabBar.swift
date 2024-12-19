//
//  TabBar.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI

struct TabBar: View {
    
    @State private var tabSelection = 1
    @State var moveToAutoBooking = false
    init() {
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.white)
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.primaryBlue)
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.primaryBlue)]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.gray)
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.gray)]

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        

        
    }
    
    var body: some View {
        
        tabBar
        
    }

    
}

extension TabBar {
    
    var tabBar: some View {
        
        TabView(selection: $tabSelection){

            
            GraphicsView()
                .tabItem {
                    
                    withAnimation(.linear(duration: 0.5)) {
                        
                        Label{
                            
                            Text("Graphics")
                            
                        } icon: {
                            
                            ImageName.graphics
                                .renderingMode(.template)
                            
                            
                        }
                        
                    }
                    
                    
                }
                .tag(1)
            
            
            SearchView()
                .tabItem {
                    
                    withAnimation(.linear(duration: 0.5)) {
                        
                        Label{
                            
                            Text("Search")
                            
                        } icon: {
                            
                            ImageName.search
                                .renderingMode(.template)
                            
                            
                        }
                        
                    }
                    
                    
                }
                .tag(2)
           
            FavouritesView()
                .tabItem {
                    
                    withAnimation(.linear(duration: 0.5)) {
                        
                        Label{
                            
                            Text("Favourites")
                            
                        } icon: {
                            
                            ImageName.favourites
                                .renderingMode(.template)
                            
                            
                        }
                        
                    }
                    
                    
                }
                .tag(3)
            
            CreateSVGView()
                .tabItem {
                    
                    withAnimation(.linear(duration: 0.5)) {
                        
                        Label{
                            
                            Text("Create SVG")
                            
                        } icon: {
                            
                            ImageName.createSVG
                                .renderingMode(.template)
                            
                            
                        }
                        
                    }
                    
                    
                }
                .tag(4)
            
        }
        
    }
    
}

#Preview {
    TabBar()
        
}
