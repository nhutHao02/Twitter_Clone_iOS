//
//  SideMenuRowView.swift
//  Twitter_Clone
//
//  Created by TranHao on 17/02/2024.
//

import SwiftUI

struct SideMenuRowView: View {
    let item:SideMenuModel
    var body: some View {
        HStack{
            Image(systemName: item.iconNameSystem)
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
            
            Text(item.description)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height:38)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(item: .profile)
    }
}
