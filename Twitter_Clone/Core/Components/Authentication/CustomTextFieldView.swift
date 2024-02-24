//
//  CustomTextFieldView.swift
//  Twitter_Clone
//
//  Created by TranHao on 18/02/2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    let iconName: String
    var isSecureField: Bool?
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            if isSecureField ?? false {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .font(.title2)
            }
        }
        Divider()
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant(" "), placeholder: "a", iconName: " ")
    }
}
