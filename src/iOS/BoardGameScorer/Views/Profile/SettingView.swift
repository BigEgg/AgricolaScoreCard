//
//  SettingView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SettingView()
            }
            .environment(\.colorScheme, .light)
            
            NavigationView {
                SettingView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
