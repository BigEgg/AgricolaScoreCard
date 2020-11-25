//
//  UserRepository.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/24/20.
//

import Foundation

class UserData: ObservableObject {
    @Published var userId: String {
        didSet {
            UserDefaults.standard.set(userId, forKey: "user_id")
        }
    }
    
    init(userId: String = "") {
        self.userId = userId.isEmpty ?
            UserDefaults.standard.string(forKey: "user_id") ?? "" :
            userId
    }
}
