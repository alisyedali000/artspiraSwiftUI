//
//  SubscrptionManager.swift
//  Artspira
//
//  Created by Syed Ahmad  on 02/01/2025.
//
import Foundation
import RevenueCat

class SubscriptionManager: ObservableObject{
    
    static let shared = SubscriptionManager()
    
    @Published var showPaywall = true
    
    private init() {
        Purchases.shared.getCustomerInfo(completion: { info, error in
            
            if info?.entitlements.all["pro"]?.isActive == true {
                
                self.showPaywall = false
                
            }
            
        })
    }
    
    func restorePurchases(completion: @escaping (Bool) -> Void) {
        
        Purchases.shared.restorePurchases(completion: { info, error in
            
            if let error = error {
                print("Error fetching customer info: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            if info?.entitlements.all["pro"]?.isActive == true {
                
                completion(true)
                
            } else {
                completion(false)
            }
            
        })
    }
    
    func status(completion: @escaping (Bool) -> Void) {
        Purchases.shared.getCustomerInfo { info, error in
            if let error = error {
                print("Error fetching customer info: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            if info?.entitlements.all["pro"]?.isActive == true {
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    
}
