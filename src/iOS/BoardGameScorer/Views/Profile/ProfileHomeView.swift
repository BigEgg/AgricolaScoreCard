//
//  ProfileView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct ProfileHomeView: View {
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var players: FetchedResults<Player>
    
    @EnvironmentObject var userData: UserData;
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileHeaderView(players: players, userId: userData.userId)
                    .padding(.horizontal)
                
                List {
                    Section {
                        SettingMenueRow(destinationView: LocalPlayersView(), caption: "Local Players", image: Image.init(systemName: "person.3"), info: String(players.count - 1))
                    }
                    Section {
                        SettingMenueRow(destinationView: SettingView(), caption: "Settings", image: Image.init(systemName: "gearshape"))
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Profile")
            .navigationBarHidden(true)
        }
    }
}

struct ProfileHeaderView: View {
    var players: FetchedResults<Player>
    var userId: String
        
    var body: some View {
        let user = players.first(where: { $0.id == UUID(uuidString: userId) })!
        
        HStack {
            ZStack {
                Circle()
                    .fill(Color(UIColor.systemGray2))
                    .frame(width: 75, height: 75)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Text(user.firstChar)
            }
            VStack {
                Text(user.name!)
            }
            .padding(.leading)
            Spacer()
        }
        .frame(height: 100)
    }
}


struct SettingMenueRow<Destination>: View where Destination : View {
    var destinationView: Destination
    var caption: String
    var image: Image
    var info: String = ""
    
    var body: some View {
        NavigationLink(destination: destinationView) {
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
        .environmentObject(UserData.preview)
    }
}
