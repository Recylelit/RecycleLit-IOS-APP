//
//  RecyclelitApp.swift
//  Recyclelit
//
//  Created by Alex Tran on 3/31/23.
//

import SwiftUI

@main
struct RecyclelitApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
