//
//  LocationDeniedView.swift
//  CitySights
//
//  Created by Alex Tran on 3/26/23.
//

import SwiftUI

struct LocationDeniedView: View {
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                Text("Whoops")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                Text("We need to access your location")
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                Spacer()
                Button {
                    // open setting
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 48)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        Text("Go to setting")
                            .bold()
                            .foregroundColor(backgroundColor)
                    }
                }.padding(20)
                Spacer()
            }.multilineTextAlignment(.center)
        }.background(backgroundColor)
            .ignoresSafeArea()
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
