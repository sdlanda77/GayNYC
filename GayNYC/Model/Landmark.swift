//
//  Landmark.swift
//  GayNYC
//
//  Created by Sam Landa on 12/27/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var addy: String
    var neighborhood: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool //these can be sponsors
    
    var category: Category //TODO update this for our sites
    enum Category: String, CaseIterable, Codable {
        //case lakes = "Lakes"
        //case rivers = "Rivers"
        //case mountains = "Mountains"
        
        case bars = "Bars"
        case activism = "Sites of Activism and Resistance"
        case misc = "Miscellaneous"
        case politics = "Political Sites"
        
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    //added, cahnge to imageName + 1 when all photos are there
    var detailImage1: Image {
        Image("stonewall2")
    }
    var detailImage2: Image {
        Image("stonewall1")
    }
    var detailImage3: Image {
        Image("stonewall3")
    }
    var detailImage4: Image {
        Image("stonewall4")
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
