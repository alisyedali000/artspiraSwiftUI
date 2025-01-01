//
//  UserDefaultManagers.swift
//  Artspira
//
//  Created by Syed Ahmad  on 31/12/2024.
//

import Foundation

import Foundation
import Combine
import SwiftUI


enum UserDefaultEnum: String {

    case favourites
    case splashStatus
    
}


class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    let userDefaults : UserDefaults = UserDefaults.standard


    static let Authenticated = PassthroughSubject<Bool, Never>()
    
    static func IsAuthenticated() -> Bool {

        if shared.getFavourites().count > 0 {
            
            return true
            
        }
        
        return false
    }
    


    func removeAll() {
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        UserDefaultManager.Authenticated.send(false)
    }
    


    func setFavourites(favourites: [String]){
        userDefaults.set(favourites, forKey: UserDefaultEnum.favourites.rawValue)
    }
    
    func getFavourites() -> [String]{
        if let savedFileNames = userDefaults.array(forKey: UserDefaultEnum.favourites.rawValue) as? [String] {
            debugPrint(savedFileNames)
            return savedFileNames
        }
        debugPrint("returned empty")
        return []
    }
    
    func setSplashShown(){
        userDefaults.set(true, forKey: UserDefaultEnum.splashStatus.rawValue)
    }
    
    func isSplashShown() -> Bool{
        userDefaults.bool(forKey: UserDefaultEnum.splashStatus.rawValue)
    }


}
