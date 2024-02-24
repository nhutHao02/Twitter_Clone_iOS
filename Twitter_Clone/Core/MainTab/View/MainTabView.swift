//
//  MainTab.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab:Tabs = .Home
    @State private var showMenu:Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Group{
            if authViewModel.userSession == nil {
                LoginView()
            } else {
                mainInterface
            }
        }
            
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainTabView()
        }
    }
}
extension MainTabView{
    var tabsView: some View{
        TabView(selection: $selectedTab){
            FeedView()
                .onTapGesture {
                    selectedTab = .Home
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tabs.Home)
            SearchView()
                .onTapGesture {
                    selectedTab = .Search
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tabs.Search)
            
            NotificationView()
                .onTapGesture {
                    selectedTab = .Notification
                }
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(Tabs.Notification)
            MessageView()
                .onTapGesture {
                    selectedTab = .Message
                }
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(Tabs.Message)
        }
    }
    var mainInterface: some View {
        ZStack(alignment: .topLeading){
            tabsView
                .navigationTitle(selectedTab.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(showMenu)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.easeInOut) {
                                showMenu.toggle()
                            }
                        } label: {
                            if let url = authViewModel.currentUser?.urlIMG {
                              ImageUserView(nameIMG: url, typeIMG: true, size: 45)
                            } else {
                                ImageUserView(nameIMG: "person.circle.fill", typeIMG: false, size: 45)
                                    
                            }
                        }
                        
                    }
                }
            
            if showMenu {
                ZStack{
                    Color.black.opacity(0.25)
                }
                .onTapGesture {
                        showMenu = false
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white: .clear)
        }
        .onAppear{
            showMenu=false
        }
    }
}
