//
//  BabelCookbookApp.swift
//  Babel Beauty
//
//  Created by Sebastian Cruz on 4/30/22.
//

import SwiftUI

@main
struct BabelBeautyApp: App {
    // This connects our newfangled SwiftUI app with the UIApplicationDelegate
    // object mentioned in the Firebase documentation.
    @UIApplicationDelegateAdaptor(BabelBeautyAppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BabelBeautyAuth())
                .environmentObject(BabelBeautyArticle())
        }
    }
}

