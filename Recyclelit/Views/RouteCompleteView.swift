//
//  RouteCompleteView.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct RouteCompleteView: View {
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                Text("Good work!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                Text("Please deliver all picked up item back to station")
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                Spacer()
                    ZStack{
                        let url = URL(string: "maps://?saddr=&daddr=\(36.05028872163286),\(-94.16371711627623)")
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Link("Open in maps", destination: url!)
                            .bold()
                            .foregroundColor(backgroundColor)
                    }
                    .padding()
                Spacer()
            }.multilineTextAlignment(.center)
        }.background(backgroundColor)
            .ignoresSafeArea()
    }
}

struct RouteCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteCompleteView()
    }
}
