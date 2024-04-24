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
                    HStack (spacing: 16) {
                        Image(systemName: item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height: 50)
                            .padding()
                            .background(item.uiColor)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        Text(item.name)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}
