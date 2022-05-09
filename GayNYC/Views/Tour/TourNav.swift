//
//  TourNav.swift
//  GayNYC
//
//  Created by Sam Landa on 1/6/22.
//

//TO DO: make this a route instead of a marker

import SwiftUI
import MapKit
//added
import AVFoundation
var player: AVAudioPlayer?

//WHY is this not showing the correct location
struct TourNav: View {

    @EnvironmentObject var modelData: ModelData
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.734547,
                                           longitude: -74.002119),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    
    
    public var landmark: Landmark
    /*
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }*/
    @State var played = false
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinates, place: Place(name: landmark.name, latitude: landmark.locationCoordinates.latitude, longitude: landmark.locationCoordinates.longitude), mapType: .satellite)
                .ignoresSafeArea(edges: .vertical)
                .onAppear{
                    playSound()
                }
                .onDisappear{
                    player?.stop()
                }
                
            
            VStack {
                Text("Proceed to " + landmark.name)
                    .font(.title)
                    .padding(.bottom, -15.0)
                    
                    
                NavigationLink {
                    TourDetail(landmark: landmark) //change to TourDetail when Chauncey adds naration
                } label: {
                    Text("Arrived")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding(.all)
                        
                        //.border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                        //.frame(maxWidth: .infinity, alignment: .center)
                        //.offset(y: -15)
                }
                
                Button("Replay audio"){
                    playSound()
                }
                .padding(.bottom, 10.0)
            }
        }
        
    }
    
    
    
    
    func playSound(){
        print("play sound")
        var audioPlayer = player
        let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
        print("breakpoint 1")
        let audioSession = AVAudioSession.sharedInstance()
        print("breakpoint 2")
        do{
            try audioSession.setMode(.default)
            print("breakpoint 3")
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            print("breakpoint 4")
            guard let urlString = urlString else {
                return
            }
            print("URL String: " + urlString)
            //let url = URL(fileURLWithPath: urlString)
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let audioPlayer = player else {
                return
            }
            if(!audioPlayer.isPlaying){
                audioPlayer.play()
            }else{
                audioPlayer.stop()
            }
            
        }
        catch{
            print("something went wrong")
        }
    }
        
    
    func getDestLocation(for mapView: MKMapView) -> CLLocation {
            let latitude = landmark.locationCoordinates.latitude
            let longitude = landmark.locationCoordinates.longitude
            
            return CLLocation(latitude: latitude, longitude: longitude)
        }
    
}

struct TourNav_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TourNav(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    var locationManager: CLLocationManager?
    //@StateObject private var modelData = ModelData()
    
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
                //self.mapView.addOverlay(route.polyline)
                //self.mapView?.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordinate       = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(Double(modelData.landmarks[0].locationCoordinates.latitude)), longitude: CLLocationDegrees(Double(modelData.landmarks[0].locationCoordinates.longitude)))//may need a function to get the location from landmark
            let startingLocation            = MKPlacemark(coordinate: coordinate)//starts at user location
            let destination                 = MKPlacemark(coordinate: destinationCoordinate)
            
            let request                     = MKDirections.Request()
            request.source                  = MKMapItem(placemark: startingLocation)
            request.destination             = MKMapItem(placemark: destination)
            request.transportType           = .walking
            request.requestsAlternateRoutes = false //don't think this is needed
            
            return request
        }
    */
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

