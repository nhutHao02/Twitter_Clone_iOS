//
//  LoginView.swift
//  Twitter_Clone
//
//  Created by TranHao on 18/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""
    @EnvironmentObject var authViewModel:AuthViewModel
    var body: some View {
        VStack{
            // header
            AuthHeaderView(lineText1: "Hello.", lineText2: "Wellcome Back")
            
            Image("twitter-logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack(spacing: 12){
                CustomTextFieldView(text: $email, placeholder: "Email", iconName: "envelope")
                CustomTextFieldView(text: $pass, placeholder: "Password", iconName: "lock", isSecureField: true)
            }
            .padding(.horizontal)
            
            HStack{
                Spacer()
                Text("Forgot password?")
                    .foregroundColor(.blue)
                    .underline()
                    .padding()
            }
            // button Sign In
            Button {
                authViewModel.login(email: email, pass: pass)
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
            }
            .frame(width: 340, height: 50)
            .background(.blue)
            .clipShape(Capsule())
            .padding()

            Spacer()
            // Navigate to Sign Up
            HStack(spacing: 10){
                Text("Don't have an account?")
                NavigationLink {
                    RegisterView()
                        .navigationBarHidden(true)
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView()
        }
    }
}
