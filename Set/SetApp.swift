//
//  SetApp.swift
//  Set
//
//  Created by Chad Smith on 6/8/21.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(game: SetGameViewModel())
        }
    }
}
