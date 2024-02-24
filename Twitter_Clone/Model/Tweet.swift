//
//  Tweet.swift
//  Twitter_Clone
//
//  Created by TranHao on 23/02/2024.
//

import FirebaseFirestoreSwift
import Firebase

class Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let comment: Int
    let like: Int
    let reTweet: Int
    var urlIMG: [String]?
    let timestamp: Timestamp
    let uid: String
    
    var user: User?
}
