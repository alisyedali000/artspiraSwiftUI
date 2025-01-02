//
//  ArtspiraApp.swift
//  Artspira
//
//  Created by Syed Ahmad  on 19/12/2024.
//

import SwiftUI
import RevenueCat

@main
struct ArtspiraApp: App {
    
    init(){
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_zwSFAeUWNuyMFlPkUZfeckrmtyA")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }
        }
    }
}
