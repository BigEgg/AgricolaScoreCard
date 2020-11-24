//
//  BoardGameScorerApp.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/21/20.
//

import SwiftUI

@main
struct BoardGameScorerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
