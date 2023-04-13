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
            Spacer()
            Image("appstore")
                .resizable()
                .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding()
            Spacer()
            Text("We need your location to continue")
            Button {
                model.requestGeoLocationPermission()
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(Constants.accentColor)
                        .cornerRadius(10)
                        .frame(height: 48)
                        .padding()
                    Text("Request location")
                        .foregroundColor(.white)
                        .bold()
                }
            }

        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
