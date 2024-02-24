//
//  NewTweetView.swift
//  Twitter_Clone
//
//  Created by TranHao on 18/02/2024.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var newTweetViewModel = NewTweetViewModel()
    var body: some View {
        VStack{
            // navigation bar
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                Spacer()
                Button {
                    newTweetViewModel.uploadTweet(caption: caption)
                } label: {
                    Text("Tweet")
                        .foregroundColor(.white)
                        .frame(width: 60)
                        .padding(8)
                }
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding()
            
            // image User
            HStack(alignment: .top, spacing: 10){
                if let url = authViewModel.currentUser?.urlIMG {
                    ImageUserView(nameIMG: url, typeIMG: true, size: 60)
                } else {
                    ImageUserView(nameIMG: "person.circle.fill", typeIMG: false, size: 60)
                        
                }
                // Input Text
                textArea
            }
            .padding(.horizontal, 10)
            
            Spacer()
        }
        .onReceive(newTweetViewModel.$uploadTweetSuccess) { succses in
            if succses {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
extension NewTweetView{
    var textArea: some View{
        ZStack(alignment: .topLeading) {
            TextEditor(text: $caption)
            if caption.isEmpty {
                Text("Enter your moment...")
                    .foregroundColor(.gray)
                    .padding(.vertical)
            }
        }
    }
}

