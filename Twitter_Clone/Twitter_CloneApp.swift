//
//  Twitter_CloneApp.swift
//  Twitter_Clone
//
//  Created by TranHao on 06/02/2024.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Twitter_CloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel:AuthViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainTabView()
            }
            .environmentObject(authViewModel)
        }
    }
}
