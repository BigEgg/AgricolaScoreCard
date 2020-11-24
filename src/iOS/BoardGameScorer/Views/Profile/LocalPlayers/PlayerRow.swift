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
            Text(player.name)
            Spacer()
        }
    }
}


struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerRow(player: Player.previewData[0])
            PlayerRow(player: Player.previewData[1])
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
