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
    @Published var searchText = ""
    @Published var searchResults : [String] = []
    
    @Published var randomCategoriesNames : [String] = []
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

    func searchFromCategories() {
        
        self.searchResults.removeAll()
        for (_, fileNames) in CategoryManager.shared.categories {
            for fileName in fileNames {
                if fileName.lowercased().contains(searchText.lowercased()) { // Check if the filename contains the query
                    searchResults.append(fileName)
                }
            }
            
        }
        debugPrint(searchResults)
        
    }
    
    func searchCategories(categoryName: String) {
        self.searchResults.removeAll()
        for (fileName, values) in CategoryManager.shared.categories {
            if fileName.contains(categoryName) { // Match query with fileName
                searchResults.append(contentsOf: values) // Append all associated values
                debugPrint(searchResults)
            }
        }
    }
    
    func getRandomCategoryNames() {
        let count: Int = 5
        let randomCategoriesCount = min(count, CategoryManager.shared.categories.count)
        self.randomCategoriesNames.removeAll()
        self.randomCategoriesNames = Array(CategoryManager.shared.categories.keys.shuffled().prefix(randomCategoriesCount))
        
    }
}
