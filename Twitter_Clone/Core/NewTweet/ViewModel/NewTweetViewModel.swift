//
//  NewTweetViewModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 22/02/2024.
//

import Foundation

class NewTweetViewModel: ObservableObject{
    @Published var uploadTweetSuccess = false
    let service = TweetService()
    
    func uploadTweet(caption: String) {
        self.service.uploadTweet(caption: caption) { complete in
            if complete {self.uploadTweetSuccess = true}
        }
    }
}
