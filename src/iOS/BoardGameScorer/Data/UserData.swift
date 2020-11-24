//
//  UserData.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import Foundation
import Combine

final class UserData : ObservableObject  {
    @Published var user: Player = Player(id: UUID(), name: "User")
    @Published var players: [Player] = Player.previewData
}
