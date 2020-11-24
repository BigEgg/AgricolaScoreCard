//
//  SplashView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/21/20.
//

import SwiftUI

struct SplashView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Path { path in
                    path.addLines([
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: screenWidth, y: 0),
                        CGPoint(x: screenWidth, y: screenHeight / 3 * 2),
                        CGPoint(x: 0, y: screenHeight / 3),
                    ])
                }
                .fill(Color.pink).opacity(0.7)
                
                Path { path in
                    path.addLines([
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: screenWidth, y: 0),
                        CGPoint(x: screenWidth, y: screenHeight / 3),
                        CGPoint(x: 0, y: screenHeight / 3 * 2),
                    ])
                }
                .fill(Color.orange).opacity(0.7)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: screenHeight / 5)
                VStack {
                    Text("Board Game")
                        .font(.system(size: 55.0, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                    Text("Scorer")
                        .font(.system(size: 55.0, weight: .regular, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
                HStack {
                    Text("A")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text("BigEgg")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                    Text("Product")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Spacer()
                    .frame(height: 20)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView()
                .environment(\.colorScheme, .light)
            SplashView()
                .environment(\.colorScheme, .dark)
        }
    }
}
