//
//  CategoryHome.swift
//  GayNYC
//
//  Created by Sam Landa on 12/28/21.
//

import SwiftUI

struct CategoryHome: View {
    let coverImage = UIImage(named: "cover")
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                Image("cover")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .offset(y: 10)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                //.padding(.leading, -25)
                .listRowInsets(EdgeInsets())
                
            }
                .navigationTitle("Browse by categories")
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
