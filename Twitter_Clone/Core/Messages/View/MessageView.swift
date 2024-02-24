//
//  MessageView.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import SwiftUI

struct MessageView: View {
    @State var showNewMessage = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Text("Wellcome to my message!")
                        .font(.title)
                        .bold()
                    
                    Text("Drop a line, share post and more with private conversations between you and other on Twitter")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Button {
                showNewMessage.toggle()
            } label: {
                Image(systemName: "plus.bubble")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)

            }
            .background(.blue)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewMessage) {
                NewTweetView()
            }

        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
