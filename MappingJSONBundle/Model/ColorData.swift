//
//  ColorData.swift
//  MappingJSONBundle
//
//  Created by Macbook Pro on 24/04/24.
//

import Foundation
import SwiftUI

struct ColorData: Codable, Identifiable {
    var id: Int
    var name: String
    var color: String
    var image: String
    
    // Color Form HEX
    var uiColor: Color {
        colorFromHexString(color)
    }
    
    var uiImage: Image {
        Image(systemName: image)
    }
}

// MARK: - MOCKUP DATA
// Parsing Datanya
extension ColorData {
    static func loadColorData() -> [ColorData] {
        // Jika ada bundle maka segera dibuat handle nya
        guard let url = Bundle.main.url(forResource: "Colors",
                withExtension: ".json"), let data = try? Data(contentsOf: url)
        else {
            fatalError("Failed to Load JSON Data from Bundle")
        }
        
        // Handle Bundle
        do {
            let decodedColor = try  JSONDecoder().decode([ColorData].self, from: data)
            return decodedColor
        } catch {
            fatalError("Failed to Decode JSON Data from Bundle: \(error.localizedDescription)")
        }
    }
}
