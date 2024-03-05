//
//  SF_Symbol_FinderApp.swift
//  SF-Symbol-Finder
//
//  Created by 제나 on 3/4/24.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct SF_Symbol_FinderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Orientation())
        }
    }
}
