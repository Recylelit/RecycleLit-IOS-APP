//
//  OnboardingView.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack{
            Text("We need your location man")
                .onAppear {
                    model.requestGeoLocationPermission()
                }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
