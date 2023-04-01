//
//  ContentView.swift
//  CitySights
//
//  Created by Alex Tran on 3/25/23.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack {
            // Detect the authorization status of geolocating the user
            switch model.authorizationState {
            case .notDetermined:
                OnboardingView()
            case .authorizedAlways, .authorizedWhenInUse:
                HomeView()
            case .denied, .restricted:
                LocationDeniedView()
            default:
                Text("Internal error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(ContentModel())
    }
}
