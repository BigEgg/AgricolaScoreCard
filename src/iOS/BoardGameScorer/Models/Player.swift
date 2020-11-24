//
//  Player.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import Foundation

struct Player: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    
    var firstChar: String {
        return name[0];
    }
}
