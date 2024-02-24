//
//  TweetFilterModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import Foundation
enum TweetFilterModel:Int, CaseIterable {
    case tweets
    case replies
    case medias
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .medias:
            return "Medias"
        case .likes:
            return "Likes"
        }
    }
}
class ProfileViewModel: ObservableObject {
    @Published var tweets: [Tweet] = []
    let service = TweetService()
    var user: User
    var actionButtonType: String {
        return user.isCurrentUser ? "Edit Button" : "Follow"
    }
    
    init(user: User) {
        self.user = user
    }
    
    func fetchTweet(){
        guard let uid = user.id else {return}
        service.fetchTweets(uid: uid) { tweets in
            self.tweets = tweets
            // update userCurrent for tweets
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
}


