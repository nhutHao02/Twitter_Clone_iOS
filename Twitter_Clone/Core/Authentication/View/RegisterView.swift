//
//  RegisterView.swift
//  Twitter_Clone
//
//  Created by TranHao on 18/02/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var userName = ""
    @State private var fullName = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel:AuthViewModel
    var body: some View {
        VStack{
            // hearder
            AuthHeaderView(lineText1: "Get Started.", lineText2: "Create your account")
            
            Image("twitter-logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack(spacing: 12){
                CustomTextFieldView(text: $email, placeholder: "Email", iconName: "envelope")
                CustomTextFieldView(text: $fullName, placeholder: "Full name", iconName: "person")
                CustomTextFieldView(text: $userName, placeholder: "User name", iconName: "person")
                CustomTextFieldView(text: $pass, placeholder: "Password", iconName: "lock", isSecureField: true)
            }
            .padding(.horizontal)
            
            // button Sign Up
            Button {
                authViewModel.register(email: email,
                                       pass: pass,
                                       userName: userName,
                                       fullName: fullName)
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white)
            }
            .frame(width: 340, height: 50)
            .background(.blue)
            .clipShape(Capsule())
            .padding()

            Spacer()
            
            // Naviagte to Sign In
            HStack(spacing: 10){
                Text("Don't have an account?")
                Text("Sign In")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
