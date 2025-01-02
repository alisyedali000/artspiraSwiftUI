//
//  SubscriptionScreen.swift
//  Artspira
//
//  Created by Syed Ahmad  on 31/12/2024.
//

import SwiftUI
import RevenueCat

struct SubscriptionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var offering : Offering?
    @State var selectedPackage : Package?
    @State var showLoader = false
    @State var freeTrial = true
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundStyle(.blue.opacity(0.05))
                .ignoresSafeArea()
            
            screenView
            
            LoaderView(isLoading: $showLoader)
        }
            .onAppear(){
                
                Purchases.shared.getOfferings { offering, error in
                    if let offer = offering?.current, error == nil{
                        self.offering = offer
                        self.selectedPackage = self.offering?.availablePackages.first
                    }
                }
                
            }
        
    }
}
extension SubscriptionScreen{
    
    var screenView: some View {
        
        ZStack(alignment: .topTrailing){

            ScrollView(showsIndicators: false){
                
                VStack{
                    
                    ImageName.subscriptionScreenImage
                        .resizable()
                        .frame(width: 343, height: 333)
                    
                    
                    header
                    
                    if self.offering != nil {
                        
                        VStack{
                            
                            
                            freeTrialToggle
                            
                            ForEach(self.offering!.availablePackages){ pkg in
                                
                                productCell(package: pkg)
                                    .onTapGesture{
                                        self.selectedPackage = pkg
                                    }
                                
                            }
                            
                            purchaseButton
                            
                            Text("Any active subscription will be refunded. \nCancel any time.")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal)
                        .padding(.vertical,25)
                        .background(
                            
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(LinearGradient(colors: [Color(hex: "#8CBBF3"), Color(hex: "#DCA5CD")], startPoint: .top, endPoint: .bottom))
                        )
                        
                    } else {
                        
                        ProgressView()
                    }
                    
                }
                
            }
            
            dismissButton
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

extension SubscriptionScreen{
    
    var header: some View {
        
        VStack(spacing: 15){
            
            Text("Get Graphics for Artspira Pro")
                .font(.semiBold(size: 20))
            
            Text("Customize & Create all-in-one app")
                .font(.regular(size: 17))
        }
        
    }
    
    var dismissButton: some View {
        
        HStack{
            
            Spacer()
            
            Image(systemName: "xmark")
        }
        .padding()
        .onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func productCell(package: Package) -> some View {
        
        HStack{
            if let period = package.storeProduct.subscriptionPeriod{
                
                VStack(alignment: .leading){
                    
                    Text(period.durationTitle)
                        .font(.semiBold(size: 19))
                        .foregroundStyle(Color.primaryBlue)
                    
                    Text("\(package.localizedPriceString) - \(period.periodTitle)")
                        .font(.medium(size: 17))
                    Text("With 3-Days Free Trial")
                        .font(.medium(size: 17))
                }
                
                
                Spacer()
                
                Text("\(package.localizedPriceString) - \(period.durationTitle)")
                    .foregroundStyle(Color.primaryBlue)
                    .font(.medium(size: 17))
                
                
            }
        }
        .padding()
        .background(
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
                .addStroke(radius: 10, color: self.selectedPackage == package ? .primaryBlue : .white, lineWidth: self.selectedPackage == package ? 2 : 1)
            
        )
        
        
    }
    
    
    var freeTrialToggle: some View {
        
        HStack{
            
            Text("Not sure yet? Enable Free Trial")
                .font(.semiBold(size: 14))
                .lineLimit(1)
                .frame(width: 210)
            
            Spacer()
            
            Toggle(isOn: $freeTrial) {
                
            }
            
        }
        .padding()
        .background(
            
            RoundedRectangle(cornerRadius: 99)
                .foregroundStyle(Color.white)
                
        )
        
    }
    
    var purchaseButton: some View {
        
        AppButton(title: "Continue") {
            self.showLoader = true
            Purchases.shared.purchase(package: selectedPackage!) { (transaction, customerInfo, error, userCancelled) in
                if customerInfo?.entitlements["pro"]?.isActive == true {
                    self.presentationMode.wrappedValue.dismiss()
                    debugPrint("Purchased")
                }
                self.showLoader = false
            }
            
        }
        .disabled(selectedPackage == nil)
        
    }
}

#Preview {
    SubscriptionScreen()
}


