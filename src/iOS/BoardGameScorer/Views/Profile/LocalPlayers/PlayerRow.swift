//
//  PlayerRow.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import SwiftUI

struct PlayerRow: View {
    var player: Player
    
    var body: some View {
        HStack {
            AvatarView(firstChar: player.firstChar)
            Text(player.name!)
            Spacer()
        }
    }
}


struct PlayerRow_Previews: PreviewProvider {
    static let viewConent = PersistenceController.preview.container.viewContext
    static func getPlayer(name: String) -> Player {
        let player = Player(context: viewConent)
        player.id = UUID()
        player.name = name
        return player
    }
    
    static var previews: some View {
        Group {
            PlayerRow(player: getPlayer(name: "BigEgg"))
            PlayerRow(player: getPlayer(name: "Chang"))
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
