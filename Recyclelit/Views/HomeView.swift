//
//  ContentView.swift
//  Recyclelit
//
//  Created by Alex Tran on 3/31/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedLocation: PickupData?
    @State var isMapViewActive = false
    @State private var currPickupLocationIndex = 0
    @State var isDetailViewShowing = false
    
    var body: some View {
        VStack{
            if !isMapViewActive {
                Button {
                    isMapViewActive = true
                } label: {
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .frame(height: 48)
                            .padding()
                        Text("Switch to map view")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                GeometryReader { geo in
                    TabView(selection: $currPickupLocationIndex) {
                        if model.locations.count > 0 {
                            ForEach(0..<model.locations.count, id: \.self) { index in
                                Button {
                                    self.isDetailViewShowing = true
                                } label: {
                                    VStack{
                                        MapDirectionView(pickupLocation: model.locations[index])
                                            ZStack{
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                HStack{
                                                    VStack(alignment: .leading) {
                                                        Text(model.locations[index].itemName)
                                                            .font(.system(size: 24))
                                                        Text("Weight: " + model.locations[index].itemWeight)
//                                                            .font(.headline)
                                                    }
                                                    .padding()
                                                    Spacer()
                                                }
                                            }.frame(height: 70)
                                           
                                        .accentColor(.black)
                                    }
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding()
                                }
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                }
                Button {
                    currPickupLocationIndex += 1
                } label: {
                    HStack{
                        Text("next pickup")
                        Image(systemName: "arrow.right.circle")
                    }
                }

            } else {
                ZStack{
                    MapView(selectedLocation: $selectedLocation)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Button {
                            isMapViewActive = false
                        } label: {
                            ZStack{
                                Rectangle()
                                    .cornerRadius(10)
                                    .frame(height: 48)
                                    .padding()
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                Text("Switch to card view")
                                    .bold()
                                    .foregroundColor(.blue)
                            }
                        }
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
