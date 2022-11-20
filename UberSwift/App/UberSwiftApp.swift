//
//  UberSwiftApp.swift
//  UberSwift
//
//  Created by BekRoz on 19/11/22.
//
//  Credits: AppStuff YT channel

import SwiftUI

@main
struct UberSwiftApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
