//
//  FeedViewModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 23/02/2024.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets: [Tweet] = []
    let service = TweetService()
    let userService = UserService()
    init() {
        self.fetchTweets()
    }

    func fetchTweets() {
        self.service.fetchTweets { tws in
            self.tweets = tws
            
            // update User for tweets
            for i in 0 ..< self.tweets.count {
                let uid = self.tweets[i].uid
                self.userService.fetchUser(uid: uid) { user in
                    self.tweets[i].user = user

                }
                
            }
        }
        
    }
}
