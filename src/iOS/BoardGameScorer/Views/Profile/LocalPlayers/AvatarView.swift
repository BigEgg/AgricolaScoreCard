//
//  AvatarView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import SwiftUI

struct AvatarView: View {
    var imageName = "";
    var firstChar = "";
    
    var body: some View {
        if imageName.isEmpty {
            ZStack {
                Circle()
                    .fill(Color(UIColor.systemGray2))
                    .frame(width: 40, height: 40)
                Text(firstChar)
            }
        } else {
            Image(imageName)
                 .resizable()
                 .frame(width: 40, height: 40)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AvatarView(imageName: "avatar_placeholder")
                .previewLayout(.fixed(width: 75, height: 75))
        
            AvatarView(firstChar: "X")
                .previewLayout(.fixed(width: 75, height: 75))
        
            AvatarView(firstChar: "X")
                .previewLayout(.fixed(width: 75, height: 75))
                .environment(\.colorScheme, .dark)
        }
    }
}
