//
//  ProfileView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct ProfileHomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var players: FetchedResults<Player>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        SettingMenueRow(destinationView: LocalPlayersView(), caption: "Local Players", image: Image.init(systemName: "person.3"), info: String(players.count))
                    }
                    Section {
                        SettingMenueRow(destinationView: SettingView(), caption: "Settings", image: Image.init(systemName: "gearshape"))
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Profile")
        }
    }
}

struct SettingMenueRow<Destination>: View where Destination : View {
    var destinationView: Destination
    var caption: String
    var image: Image
    var info: String = ""
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            VStack {
                HStack {
                    image
                        .foregroundColor(Color(UIColor.systemBlue))
                        .frame(width: 40, height: 40)
                    Text(caption)
                    Spacer()
                    if !info.isEmpty {
                        Text(info)
                    }
                }
            }
        }
    }
}

struct ProfileHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView() {
                ProfileHomeView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(TabType.Profile)
            }
            .environment(\.colorScheme, .light)
            
            TabView() {
                ProfileHomeView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(TabType.Profile)
            }
            .environment(\.colorScheme, .dark)
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
