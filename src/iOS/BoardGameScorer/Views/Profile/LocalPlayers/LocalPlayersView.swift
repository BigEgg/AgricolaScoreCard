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
    
    var body: some View {
        List {
            ForEach(players) { player in
                PlayerRow(player: player)
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
    }
}
