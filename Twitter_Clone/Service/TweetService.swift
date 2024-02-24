//
//  TweetService.swift
//  Twitter_Clone
//
//  Created by TranHao on 22/02/2024.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, comletion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let data:[String: Any] = [
            "uid": uid,
            "caption": caption,
            "like": 0,
            "comment": 0,
            "reTweet": 0,
            "timestamp": Timestamp(date: Date())
        ]
        Firestore.firestore().collection("tweets").document().setData(data) { err in
            guard err != nil else {
                print("Lỗi upLoadTweet: \(String(describing: err))")
                comletion(true)
                return
            }
            comletion(true)
            
        }
    }
    // get tweets with uid
    func fetchTweets(uid: String, completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
                
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self)})
                print("-----------")
                print(tweets)
            completion(tweets)
        }
    }
    // get all tweets
    func fetchTweets(completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()})) // return tweets with tỉmestamp sorted by descending
        }
    }
}
