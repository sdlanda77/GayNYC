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
//may cause issues with naming
//let locationManager = CLLocationManager()
//array of places to annotate
let places = [
    Place(name: "MyPlace", latitude: 40.806555, longitude: -73.963125)
]

struct MapView: View { 
    @StateObject private var viewModel = MapViewModel()
    var coordinate: CLLocationCoordinate2D
    let place: Place
    var mapType: MKMapType 
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.806555, longitude: -73.963125),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [place])
        { place in
                    MapMarker(coordinate: CLLocationCoordinate2D(
                        latitude: place.latitude,
                        longitude: place.longitude),
                           tint: Color.red)
                }
            .onAppear {
                setRegion(coordinate)
                viewModel.checkIfLocationServicesIsEnabled()
           
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
    }
    
    /*
    func updateUIView(_ uiView: MKMapView) {
        uiView.mapType = .satellite
    }
    */
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), place: places[0], mapType: .satellite)
    }
}
/*
final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            //create location manager
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            // can set to walking with locationManager?.activityType etc
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            
        }else{
            print("Not able to get location")
        }
    }
    
//directions
    /*
    func getDirections() {
        guard let location = locationManager?.location?.coordinate else {
            print("do not have location access")
            return
        }
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        
        //i think this is depricated
        //directions.calculate{ [unowned self] (response, error) in
        directions.calculate{ /*[unowned self]*/ (response,error) in
            guard let response = response else { return }
            
            for route in response.routes {
                //MapView.addOverlay(route.polyline)
                //MapView?.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
            let destinationCoordinate       = CLLocationCoordinate2D(latitude: 40.806555, longitude: -73.963125)//may need a function to get the location from landmark
            let startingLocation            = MKPlacemark(coordinate: coordinate)//starts at user location
            let destination                 = MKPlacemark(coordinate: destinationCoordinate)
            
            let request                     = MKDirections.Request()
            request.source                  = MKMapItem(placemark: startingLocation)
            request.destination             = MKMapItem(placemark: destination)
            request.transportType           = .walking
            request.requestsAlternateRoutes = false //don't think this is needed
            
            return request
        }*/
    
    /*private */func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("location is restricted.")
        case .denied:
            print("location is denied. change in settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            break //placeholder
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
 */
