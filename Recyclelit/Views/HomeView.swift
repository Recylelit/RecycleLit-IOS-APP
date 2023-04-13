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
        NavigationView {
            VStack{
                if !isMapViewActive {
                    VStack {
                        SwitchViewButton(isMapViewActive: $isMapViewActive, text: "Switch to map view", backgroundColor: Constants.accentColor)
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
                                                        }
                                                        .padding()
                                                        Spacer()
                                                        if model.locations[index].status == "completed" {
                                                            Image(systemName: "checkmark.circle.fill")
                                                                .font(.system(size: 32))
                                                                .foregroundColor(.green)
                                                                .padding()
                                                        } else if model.locations[index].status == "failed"{
                                                            Image(systemName: "x.circle.fill")
                                                                .font(.system(size: 32))
                                                                .foregroundColor(.red)
                                                                .padding()
                                                        }
                                                    }
                                                }.frame(height: 60)
                                                
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
                            if currPickupLocationIndex != model.locations.count - 1 {
                                self.currPickupLocationIndex += 1
                            }
                        } label: {
                            if currPickupLocationIndex != model.locations.count - 1 {
                                HStack{
                                    Text("next pickup")
                                    Image(systemName: "arrow.right.circle")
                                }
                            }   else {
                                NavigationLink("Complete") {
                                    RouteCompleteView()
                                }
                            }
                            
                        }
                    }
                    .sheet(isPresented: $isDetailViewShowing) {
                        DetailView(pickupLocation: $model.locations[currPickupLocationIndex])
                    }
                } else {
                    ZStack{
                        MapView(selectedLocation: $selectedLocation)
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            SwitchViewButton(isMapViewActive: $isMapViewActive, text: "Switch to card view")
                            Spacer()
                        }
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

struct SwitchViewButton: View {
    @Binding var isMapViewActive: Bool
    var text: String?
    var backgroundColor: Color?
    
    var body: some View {
        Button {
            isMapViewActive.toggle()
        } label: {
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .frame(height: 48)
                    .padding()
                    .foregroundColor(backgroundColor ?? .white)
                Text(text ?? "")
                    .bold()
                    .foregroundColor(backgroundColor != nil ? .white : Constants.accentColor )
            }
            .shadow(radius: isMapViewActive ? 10 : 0)
        }
    }
}
