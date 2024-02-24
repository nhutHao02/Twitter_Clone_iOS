//
//  User.swift
//  Twitter_Clone
//
//  Created by TranHao on 20/02/2024.
//

import FirebaseFirestoreSwift
import Firebase
struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName:String
    let fullName: String
    let email: String
    let urlIMG: String?
    
    var isCurrentUser: Bool {return Auth.auth().currentUser?.uid == id}
}
