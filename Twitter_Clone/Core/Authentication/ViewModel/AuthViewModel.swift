//
//  AuthViewModel.swift
//  Twitter_Clone
//
//  Created by TranHao on 19/02/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?{
        didSet {
          fetchUser()
        }
      }
    @Published var currentUser: User?
    private var service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(email:String, pass:String) {
        Auth.auth().signIn(withEmail: email, password: pass) { result, error in
            if let err = error {
                print("Có lỗi xảy ra: \(err)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
        }
        
    }
    
    private func saveInfoFirestoreDB(user: FirebaseAuth.User, email: String, password: String, fullName: String, userName: String) {
        let jsonData: [String: Any]  = ["email": email,
                                        "pass": password,
                                        "userName": userName,
                                        "fullName": fullName]
        Firestore.firestore().collection("user").document(userSession!.uid).setData(jsonData) { error in
            if let error = error {
                print("Lỗi thêm dữ liệu: \(error)")
            } else {
                print("Thêm dữ liệu thành công")
            }
        }
        
    }
    
    func register(email:String, pass:String, userName:String, fullName:String) {
        Auth.auth().createUser(withEmail: email, password: pass) { [self] result, error in
            if let err = error {
                print("Có lỗi xảy ra: \(err)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
            
            self.saveInfoFirestoreDB(user: user, email: email, password: pass, fullName: fullName, userName: userName)
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        service.fetchUser(uid: uid) { user in
            self.currentUser = user
        }
    }
}
