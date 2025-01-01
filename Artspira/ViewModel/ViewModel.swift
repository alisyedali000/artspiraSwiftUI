//
//  VIewModel.swift
//  Artspira
//
//  Created by Syed Ahmad  on 26/12/2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var suggestedGraphics : [String] = []
    @Published var personalizeTags = Array(CategoryManager.shared.categories.keys)
    @Published var selectedCategories : [String] = []
    
    @Published var personalizeFavourites : [String] = UserDefaultManager.shared.getFavourites()
}

extension ViewModel{
    
    func fetchSuggestedGraphics() {
        var selectedGraphics: [String] = []
        
        let maxGraphicsPerTag = 10 / selectedCategories.count
        
        for tag in selectedCategories {
            if let graphics = CategoryManager.shared.categories[tag] {
                let randomGraphics = graphics.shuffled().prefix(maxGraphicsPerTag)
                selectedGraphics.append(contentsOf: randomGraphics)
            }
        }
        
        // Ensure the total count is 10, trimming excess if needed
        suggestedGraphics = Array(selectedGraphics.shuffled().prefix(10))
    }
    
    func addFavourties(completion : @escaping () -> Void){
        UserDefaultManager.shared.setFavourites(favourites: self.personalizeFavourites)
        completion()
        
    }

}
