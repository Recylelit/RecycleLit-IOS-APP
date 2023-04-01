//
//  DirectionCard.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct DirectionCard: View {
    var pickupLocation: PickupData
    var body: some View {
        VStack{
            GeometryReader { geo in
                MapDirectionView(pickupLocation: pickupLocation)
                    .frame(height: geo.size.height * (0.7))
                HStack{
                    Text(pickupLocation.itemName)
                    Spacer()
                    Button {
                        print("here")
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(.blue)
                            Text("Get Direction")
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(height: geo.size.height * (0.3))
            }
        }
    }
}
//
//struct DirectionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        var model = ContentModel()
//        DirectionCard(pickupLocation: model.locations[0])
//    }
//}
