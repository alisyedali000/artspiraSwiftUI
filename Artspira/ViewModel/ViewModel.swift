//
//  VIewModel.swift
//  Artspira
//
//  Created by Syed Ahmad  on 26/12/2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var suggestedGraphics : [String] = []
    @Published var personalizeTags = Array(categories.keys)
    @Published var selectedCategories : [String] = []
    
    @Published var personalizeFavourites : [String] = []
}

extension ViewModel{
    
    func fetchSuggestedGraphics() {
        var selectedGraphics: [String] = []
        
        let maxGraphicsPerTag = 10 / selectedCategories.count
        
        for tag in selectedCategories {
            if let graphics = categories[tag] {
                let randomGraphics = graphics.shuffled().prefix(maxGraphicsPerTag)
                selectedGraphics.append(contentsOf: randomGraphics)
            }
        }
        
        // Ensure the total count is 10, trimming excess if needed
        suggestedGraphics = Array(selectedGraphics.shuffled().prefix(10))
    }
    
    func addFavourties(completion : @escaping () -> Void){
        
        completion()
        
    }
    
    func fetchAllGraphics(from path: String, to categories: inout [String: [String]]) {
        let fileManager = FileManager.default
        
        do {
            // Get all subdirectories in the main directory
            let subdirectories = try fileManager.contentsOfDirectory(atPath: path).filter { subPath in
                var isDir: ObjCBool = false
                let fullPath = (path as NSString).appendingPathComponent(subPath)
                return fileManager.fileExists(atPath: fullPath, isDirectory: &isDir) && isDir.boolValue
            }
            
            for subdirectory in subdirectories {
                let subdirectoryPath = (path as NSString).appendingPathComponent(subdirectory)
                
                // Get all files in the subdirectory
                let files = try fileManager.contentsOfDirectory(atPath: subdirectoryPath).filter { filePath in
                    var isDir: ObjCBool = false
                    let fullPath = (subdirectoryPath as NSString).appendingPathComponent(filePath)
                    return fileManager.fileExists(atPath: fullPath, isDirectory: &isDir) && !isDir.boolValue
                }
                
                // Add or update the category in the dictionary
                let fileNamesWithoutExtensions = files.map { ($0 as NSString).deletingPathExtension }
                if categories[subdirectory] != nil {
                    categories[subdirectory]?.append(contentsOf: fileNamesWithoutExtensions)
                } else {
                    categories[subdirectory] = fileNamesWithoutExtensions
                }
            }
        } catch {
            print("Error reading directory: \(error.localizedDescription)")
        }
    }

    
}
