//
//  ProfileView.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import SwiftUI
struct ProfileView: View {
    @State private var selectedTab: TweetFilterModel = .tweets
    @ObservedObject var profileViewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
//    private let user: User
    
    init(user:User) {
//        self.user = user
        profileViewModel = ProfileViewModel(user: user)
        
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButton
            userInfo
            tabBar
            tweetsView
            Spacer()
        }
        .navigationBarHidden(true)
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(userName: "tets", fullName: "test", email: "acb@gmail.com", urlIMG: " "))
            .previewInterfaceOrientation(.portrait)
    }
}
extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.blue)
                .ignoresSafeArea()
            
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(y: 10)
                }
                if let url = profileViewModel.user.urlIMG {
                    ImageUserView(nameIMG: url, typeIMG: true, size: 90)
                        .offset(x: 16, y: 30)
                } else {
                    ImageUserView(nameIMG: "person.circle.fill", typeIMG: false, size: 90)
                        .offset(x: 16, y: 30)
                    
                }
            }
        }
        .frame(height: 100)
    }
    var actionButton: some View {
        HStack{
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .opacity(0.85)
                .padding()
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 0.75)
                        .frame(width: 40, height: 40))
            Button {
                
            } label: {
                Text(profileViewModel.actionButtonType)
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: 20)
                        .stroke(.gray, lineWidth: 0.75)
                    )
            }
            .padding(.trailing)
        }
    }
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text(profileViewModel.user.fullName)
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@\(profileViewModel.user.userName)")
                .foregroundColor(.gray)
                .font(.subheadline)
            Text("This is a self-introduction line")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack{
                Image(systemName: "mappin.and.ellipse")
                Text("Tp.HCM, VN")
                    .foregroundColor(.gray)
                
                
                Image(systemName: "link")
                    .padding(.leading)
                Text("https://github.com/nhutHao02/")
                    .lineLimit(1)
            }
            .font(.subheadline)
            
            
            HStack{
                Image(systemName: "calendar")
                Text("Joined")
                    .foregroundColor(.gray)
                Text("Date")
                    .foregroundColor(.gray)
                
            }
            
            FollowStateView()
        }
        .padding()
    }
    var tabBar: some View {
        HStack{
            Spacer()
            ForEach(TweetFilterModel.allCases, id: \.rawValue) { item in
                Text(item.title)
                    .font(.title3)
                    .foregroundColor(selectedTab == item ? .black : .gray)
                    .underline(true,
                               color: selectedTab == item ? .blue : .clear)
                    .baselineOffset(10)
                    .onTapGesture {
                        withAnimation(.default) {
                            selectedTab = item
                        }
                    }
                Spacer()
            }
        }
    }
    var tweetsView: some View {
        ScrollView{
            LazyVStack{
                ForEach(profileViewModel.tweets) { tweet in
                    TweetRowView(tweet: tweet, user: profileViewModel.user)
                        .padding(.horizontal)
                }
            }
        }
    }
}
