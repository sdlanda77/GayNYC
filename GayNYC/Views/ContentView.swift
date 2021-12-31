//
//  ContentView.swift
//  GayNYC
//
//  Created by Sam Landa on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    //tabs that cna be displayed
    enum Tab {
        case home
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            TourMenu()
                .tabItem{
                    Label("Tour", systemImage: "figure.walk.circle.fill")
                }
            CategoryHome()
                .tabItem{
                    Label("Categories", systemImage: "book.circle.fill")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
