//
//  LandmarkDetail.swift
//  GayNYC
//
//  Created by Sam Landa on 12/27/21.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates, place: Place(name: landmark.name, latitude: landmark.locationCoordinates.latitude, longitude: landmark.locationCoordinates.longitude), mapType: .satellite)
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
                
                Divider()
                
                DetailImages(detailImage1: landmark.detailImage1, detailImage2: landmark.detailImage2, detailImage3: landmark.detailImage3, detailImage4: landmark.detailImage4)
                /*
                VStack {
                    landmark.detailImage1
                        .resizable()
                    .scaledToFit()
                
                    Text("Caption")
                        .font(.caption)
                    landmark.detailImage2
                        .resizable()
                        .scaledToFit()
                    Text("Caption")
                        .font(.caption)
                    landmark.detailImage3
                        .resizable()
                        .scaledToFit()
                    Text("Caption")
                        .font(.caption)
                    landmark.detailImage4
                        .resizable()
                        .scaledToFit()
                    Text("Caption")
                        .font(.caption)
                }*/
            }
            .padding()
            //Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)//this may need to go --> moved this from below MapView call
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
