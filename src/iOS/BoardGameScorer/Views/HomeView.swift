//
//  HomeView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/21/20.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = TabType.Plays
    
    var body: some View {
        TabView(selection: $selection) {
            PlaysHomeView()
                .tabItem {
                    selection == TabType.Plays ?
                        Image(systemName: "play.fill") :
                        Image(systemName: "play")
                    Text("Plays")
                }
                .tag(TabType.Plays)

            MeHomeView()
                .tabItem {
                    selection == TabType.Profile ?
                        Image(systemName: "person.fill") :
                        Image(systemName: "person")
                    Text("Me")
                }
                .tag(TabType.Profile)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .environment(\.colorScheme, .light)
            HomeView()
                .environment(\.colorScheme, .dark)
        }
    }
}

enum TabType {
    case Plays
    case Profile
}
