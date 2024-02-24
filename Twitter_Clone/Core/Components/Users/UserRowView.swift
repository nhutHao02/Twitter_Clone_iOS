//
//  UserRowView.swift
//  Twitter_Clone
//
//  Created by TranHao on 16/02/2024.
//

import SwiftUI

struct UserRowView: View {
    let user:User
    var body: some View {
        HStack{
            if let url = user.urlIMG {
                AsyncImage(url: URL(string: url)) { img in
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading){
                Text(user.fullName)
                    .foregroundColor(.black)
                Text("@\(user.userName)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(userName: " ", fullName: " ", email: " ", urlIMG: " "))
    }
}
