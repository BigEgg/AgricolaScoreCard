//
//  LocalPlayersView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/22/20.
//

import SwiftUI

struct LocalPlayersView: View {
    var body: some View {
        List {
        }
        .navigationBarTitle("Local Players", displayMode: .inline)
    }
}

struct LocalPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocalPlayersView()
        }
    }
}
