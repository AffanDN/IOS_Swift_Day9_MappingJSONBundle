//
//  ContentView.swift
//  MappingJSONBundle
//
//  Created by Macbook Pro on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    let colorData = ColorData.loadColorData()
    var body: some View {
        NavigationStack {
            List {
                ForEach(colorData) { item in
                    ColorRow(data: item)
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}

struct ColorRow: View {
    var data: ColorData
    var body: some View {
        HStack (spacing: 16) {
            data.uiImage
                .resizable()
                .scaledToFit()
                .frame(width:50, height: 50)
                .padding()
                .background(data.uiColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text(data.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}
