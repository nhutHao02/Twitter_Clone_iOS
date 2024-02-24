//
//  UserService.swift
//  Twitter_Clone
//
//  Created by TranHao on 20/02/2024.
//

import Firebase
import FirebaseFirestoreSwift
struct UserService {
    // get user with uid
    func fetchUser(uid: String, completed: @escaping(User) -> Void) {
        Firestore.firestore().collection("user").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else {return}
            guard let user = try? snapshot.data(as: User.self) else {return}
            completed(user)
        }
    }
    
    // get all users
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users:[User] = []
        Firestore.firestore().collection("user").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            documents.forEach { document in
                guard let user = try? document.data(as: User.self) else {return}
                users.append(user)
            }

            completion(users)
        }
    }
}
