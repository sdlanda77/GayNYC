//
//  GayNYCApp.swift
//  GayNYC
//
//  Created by Sam Landa on 12/27/21.
//

import SwiftUI

@main
struct GayNYCApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
