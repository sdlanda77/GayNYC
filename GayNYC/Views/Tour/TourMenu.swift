//
//  TourMenu.swift
//  GayNYC
//
//  Created by Sam Landa on 12/31/21.
//

import SwiftUI

struct TourMenu: View {
    //@EnvironmentObject var modelData: ModelData
    @State private var modelData = ModelData()
    var body: some View {
        NavigationView {
            List {
                Image("tourcover")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                NavigationLink {
                    TourNav(landmark: modelData.landmarks[0])
                } label: {
                    Text("Start Tour")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.all)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
                NavigationLink {
                    AboutAuthor()
                } label: {
                    Text("About the author")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                NavigationLink {
                    AboutAuthor()
                } label: {
                    Text("About the app")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
            }
            .navigationTitle("Gay New York")
            //.foregroundColor(.black)
        }
    }
}

struct TourMenu_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TourMenu()
            .environmentObject(modelData)
    }
}
