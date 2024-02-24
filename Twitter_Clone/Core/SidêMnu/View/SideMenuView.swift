//
//  SideMenuView.swift
//  Twitter_Clone
//
//  Created by TranHao on 17/02/2024.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading){
                // kiểm tra urlIMG đã có hay chưa
                if let url = user.urlIMG {
                    ImageUserView(nameIMG: url, typeIMG: true, size: 60)
                } else {
                    ImageUserView(nameIMG: "person.circle.fill", typeIMG: false, size: 60)
                        
                }
                
                Text(user.fullName)
                    .font(.title).bold()
                
                Text("@\(user.userName)")
                    .font(.caption2)
                    .foregroundColor(.gray)
                FollowStateView()
                    .padding(.vertical, 4)
                
                VStack{
                    ForEach(SideMenuModel.allCases, id: \.rawValue) { opt in
                        if opt == .profile {
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                SideMenuRowView(item: opt)
                            }
                        }else if opt == .logout {
                            Button{
                                authViewModel.signOut()
                            } label: {
                                SideMenuRowView(item: opt)
                            }
                        }else{
                            SideMenuRowView(item: opt)
                        }
                        
                        
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
