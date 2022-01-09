//
//  TourMenu.swift
//  GayNYC
//
//  Created by Sam Landa on 12/31/21.
//

import SwiftUI

struct TourMenu: View {
    var body: some View {
        NavigationView {
                List {
                            Image("tourcover")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 240)
                                .clipped()
                                .listRowInsets(EdgeInsets())
                        
                        //Spacer()
                        VStack{
                            NavigationLink {
                                TourDetail()
                            } label: {
                                Text("Start Tour")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            
                            NavigationLink {
                                AboutAuthor()
                            } label: {
                                Text("About the author")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
                    

                }
                    .navigationTitle("Gay New York")
                //.foregroundColor(.black)
        }
    }
}

struct TourMenu_Previews: PreviewProvider {
    static var previews: some View {
        TourMenu()
    }
}
