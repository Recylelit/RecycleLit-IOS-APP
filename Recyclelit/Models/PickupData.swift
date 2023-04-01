//
//  PickupData.swift
//  Recyclelit
//
//  Created by Alex Tran on 4/1/23.
//

import Foundation
struct PickupData: Decodable, Identifiable {
    var id: String
    var lat: Double
    var long: Double
    var itemName: String
    var itemWeight: String
    var itemSize: String
    var itemNotes:String
    var status: String
}
