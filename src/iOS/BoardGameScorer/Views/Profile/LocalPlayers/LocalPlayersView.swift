//
//  LocalPlayersView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct LocalPlayersView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Player.name, ascending: true)],
        animation: .default)
    private var players: FetchedResults<Player>
    
    @EnvironmentObject var userData: UserData;
    
    var body: some View {
        let uuid = UUID(uuidString: userData.userId)
        
        List {
            ForEach(players) { player in
                if player.id != uuid {
                    PlayerRow(player: player)
                }
            }
        }
        .navigationBarTitle("Local Players", displayMode: .inline)
    }
}

struct LocalPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                LocalPlayersView()
            }
            .environment(\.colorScheme, .light)
            
            NavigationView {
                LocalPlayersView()
            }
            .environment(\.colorScheme, .dark)
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .environmentObject(UserData.preview)
    }
}
