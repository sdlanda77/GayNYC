//
//  TourNav.swift
//  GayNYC
//
//  Created by Sam Landa on 1/6/22.
//

//TO DO: make this a route instead of a marker

import SwiftUI
import MapKit

//WHY is this not showing the correct location
struct TourNav: View {

    @EnvironmentObject var modelData: ModelData
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.734547,
                                           longitude: -74.002119), //stonewall
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
            MapView(coordinate: landmark.locationCoordinates, place: Place(name: landmark.name, latitude: landmark.locationCoordinates.latitude, longitude: landmark.locationCoordinates.longitude))
            .ignoresSafeArea(edges: .vertical)
        }
}

struct TourNav_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TourNav(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
