//
//  ColorFromHex.swift
//  MappingJSONBundle
//
//  Created by Macbook Pro on 24/04/24.
//

import Foundation
import SwiftUI

func colorFromHexString(_ hex: String) -> Color {
    // #273c75
    // Lakukan proses Trim : membuang spasi diawal dan diakhir string
    // menjadikan hex stringnya uppercase
    
    let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    // handle jumlah string nya = 6 / 7(Validasi HEX)
    // - Asumsi Hex Color tanpa Alpha (opacity) = jumlah 6 digit
    // - handle Hex dengan # jadinya jumlahnya 7 diigit
    
    guard hex.count == 6 || (hex.count == 7 && hex.hasPrefix("#")) else {
        return Color(red: 0, green: 0, blue: 0) // Default Color (Black)
    }
    
    // Proses Konversi HEX
    // Konversi dari String HEX dari API menjadi Swift Color
    let hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    // Ekstrak Komponen Color kedalam sususan RGB (RRGGBB)
    let redColor = hexColor.prefix(2)
    let greenColor = hexColor.dropFirst(2).prefix(2)
    let blueColor = hexColor.suffix(2)
    
    // 1. Konversi HEX yang telah didapat ke INTEGER untuk divalidasi kembali
    // 2. Radix = basis sistem bilangan matematika
    // 3. Dari konspe radix kita gunakan konversi string 0-9 dan A-Z menjadi Integer
    
    guard let r = UInt64(redColor, radix: 16),
          let g = UInt64(greenColor, radix: 16),
          let b = UInt64(blueColor, radix: 16) else {
        return Color(red: 0, green: 0, blue: 0)
    }
    
    let results = Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    
    return results
}
