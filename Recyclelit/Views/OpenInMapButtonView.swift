//
//  OpenInMapButtonView.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct OpenInMapButtonView: View {
    var pickupLocation: PickupData
    var body: some View {
        ZStack{
            let url = URL(string: "maps://?saddr=&daddr=\(pickupLocation.lat),\(pickupLocation.long)")
            Rectangle()
                .frame(height: 48)
                .foregroundColor(.blue)
                .cornerRadius(10)
            Link("Open in maps", destination: url!)
                .bold()
                .foregroundColor(.white)
        }
    }
}

//struct OpenInMapButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        OpenInMapButtonView()
//    }
//}
