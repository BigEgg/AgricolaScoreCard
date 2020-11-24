//
//  AvatarView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/23/20.
//

import SwiftUI

struct AvatarView: View {
    var imageName = "avatar_placeholder";
    
    var body: some View {
        ZStack {
           Image(imageName)
             .resizable()
             .frame(width: 37, height: 37)
         }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
            .previewLayout(.fixed(width: 75, height: 75))
    }
}
