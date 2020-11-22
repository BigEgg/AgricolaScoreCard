//
//  SplashView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/21/20.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        ZStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Board Game"/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    .bold()
                Text("Scorer")
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
