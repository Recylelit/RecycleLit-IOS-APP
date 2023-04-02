//
//  DetailView.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var pickupLocation: PickupData
    var body: some View {
        VStack{
            DetailListRow(title: "Name: ", data: pickupLocation.itemName)
            DetailListRow(title: "Weight: ", data: pickupLocation.itemWeight)
            DetailListRow(title: "Size: ", data: pickupLocation.itemSize)
            DetailListRow(title: "Type: ", data: pickupLocation.itemType)
            DetailListRow(title: "Notes: " , data: pickupLocation.itemNotes)
            DetailListRow(title: "Status", data: pickupLocation.status)
            Spacer()
            OpenInMapButtonView(pickupLocation: pickupLocation)
            Picker("Item Status", selection: $pickupLocation.status) {
                          Text("failed").tag("failed")
                          Text("completed").tag("completed")
                          Text("pending").tag("pending")
                      }
                      .pickerStyle(.segmented)
        }
        .padding()
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
