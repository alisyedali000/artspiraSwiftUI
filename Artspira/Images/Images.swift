//
//  Images.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//


import Foundation
import SwiftUI

enum ImageName: String {
    
    
    //MARK: Tabbar
    
    case setting = "setting"
    
    static var graphics: Image {
        
        Image("graphics")
    }
    
    static var search: Image {
        
        Image("Search")
    }
    
    
    static var favourites: Image {
        
        Image("favourite")
    }
    
    static var createSVG: Image {
        
        Image("Create SVG")
    }
    
    //MARK: Favourites
    
    static var emptyStatePlaceHolder: Image {
        
        Image("EmptyState")
    }
   
    
    //MARK: Navbar
    
    static var arrowBackward: Image {
        
        Image("arrow-turn-backward")
    }
    
    //MARK: Splash Image
    
    static var splashImage: Image {
        
        Image("splashImage")
    }
    
    //MARK: SubscriptionScreen
    
    static var subscriptionScreenImage: Image {
        
        Image("SubscriptionBlockImage")
    }
    
}
