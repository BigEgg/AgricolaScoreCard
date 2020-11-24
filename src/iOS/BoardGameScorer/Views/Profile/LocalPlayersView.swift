//
//  LocalPlayersView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct LocalPlayersView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.players.sorted { $0.name < $1.name }) { player in
                PlayerRow(player: player)
            }
        }
        .navigationBarTitle("Local Players", displayMode: .inline)
    }
}

struct LocalPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocalPlayersView()
        }
        .environmentObject(UserData())
    }
}
