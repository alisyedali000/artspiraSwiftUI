//
//  Constants.swift
//  Artspira
//
//  Created by Syed Ahmad  on 26/12/2024.
//
import Foundation
import RevenueCat

enum SVGSizing : String{
    
    case small = "Small"
    case medium = "Medium"
    case fullRes = "Full-Res"
    
}

extension SubscriptionPeriod {
    var durationTitle: String {
        switch self.unit {
        case .day: return "Daily"
        case .week: return "Weekly"
        case .month: return "Monthly"
        case .year: return "Yearly"
        @unknown default: return "Unknown"
        }
    }
    var periodTitle: String {
        let periodString = "\(self.value) \(self.unit.debugDescription)"
        let pluralized = self.value > 1 ? periodString + "s" : periodString
        return pluralized
    }
}


class CategoryManager: ObservableObject{
    
    static let shared = CategoryManager()
    @Published var categories: [String: [String]] = [:] //Fetching all categories and svgs
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


