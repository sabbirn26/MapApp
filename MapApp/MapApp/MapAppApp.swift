//
//  MapAppApp.swift
//  MapApp
//
//  Created by Sabbir Nasir on 5/11/23.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
            //ContentView()
        }
    }
}
