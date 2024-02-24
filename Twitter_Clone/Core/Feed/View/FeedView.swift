//
//  FeedView.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView:Bool = false
    @ObservedObject var feedViewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                ScrollView{
                    LazyVStack{
                        ForEach(feedViewModel.tweets) { tweet in
                            TweetRowView(tweet: tweet, user: tweet.user ?? User(userName: "Đedault", fullName: "default", email: "", urlIMG: ""))
                                    .padding()
                            }
                    }
                }
            // button add new tweet
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)

            }
            .background(.blue)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
