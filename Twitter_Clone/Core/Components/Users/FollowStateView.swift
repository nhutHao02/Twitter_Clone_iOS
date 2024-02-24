//
//  FollowStateView.swift
//  Twitter_Clone
//
//  Created by TranHao on 17/02/2024.
//

import SwiftUI

struct FollowStateView: View {
    var body: some View {
        HStack{
            Text("100")
            Text("Following")
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text("100")
            Text("Follower")
                .foregroundColor(.gray)
                .font(.subheadline)
        }
    }
}

struct FollowStateView_Previews: PreviewProvider {
    static var previews: some View {
        FollowStateView()
    }
}
