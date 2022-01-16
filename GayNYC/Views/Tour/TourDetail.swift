//
//  TourDetail.swift
//  GayNYC
//
//  Created by Sam Landa on 1/4/22.
//

import SwiftUI

struct TourDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates, place: Place(name: landmark.name, latitude: landmark.locationCoordinates.latitude, longitude: landmark.locationCoordinates.longitude))
                //.ignoresSafeArea(edges: .top)
                .frame(height: 300)
                .offset(y: -30)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    Spacer()
                    NavigationLink {
                        TourNav(landmark: landmark) //change to TourDetail when Chauncey adds naration
                    } label: {
                        Text("Next site")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .padding(.all)
                    }
                    //ADD: if it's the last site, "finish tour button"
                }
                HStack {
                    Text(landmark.addy)
                        //.font(.subheadline)
                    Spacer()
                    Text(landmark.neighborhood)
                        //.font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text("\n" + landmark.description)
            }
            .padding()
            //Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)//this may need to go --> moved this from below MapView call
    }
}

struct TourDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TourDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
