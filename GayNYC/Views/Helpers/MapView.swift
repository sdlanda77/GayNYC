//
//  MapView.swift
//  GayNYC
//
//  Created by Sam Landa on 12/27/21.
//

import SwiftUI
import MapKit

//struct for annotation
struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

//array of places to annotate
let places = [
    Place(name: "MyPlace", latitude: 40.734547, longitude: -74.002119)
]

struct MapView: View { 
    
    var coordinate: CLLocationCoordinate2D
    let place: Place
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.734547, longitude: -74.002119),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [place])
        { place in
                    MapMarker(coordinate: CLLocationCoordinate2D(
                        latitude: place.latitude,
                        longitude: place.longitude),
                           tint: Color.red)
                }
            .onAppear {
                setRegion(coordinate)
                
                
                
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), place: places[0])
    }
}
