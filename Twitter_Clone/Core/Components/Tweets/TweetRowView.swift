//
//  TweetRowView.swift
//  Twitter_Clone
//
//  Created by TranHao on 06/02/2024.
//

import SwiftUI

struct TweetRowView: View {
    let tweet: Tweet
    let user: User
    var body: some View {
        VStack(alignment: .leading){
                HStack (alignment: .top, spacing: 12){
                    Circle()
                        .frame(width: 54, height: 54)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                Text(user.fullName)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("2h")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                       
                        Image("image")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .cornerRadius(30)
                    }
                }
              
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "message")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.subheadline)
                    }
                    
                }
                .padding()
                Divider()
            }
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
