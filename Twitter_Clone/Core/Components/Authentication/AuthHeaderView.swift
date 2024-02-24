//
//  AuthHeaderView.swift
//  Twitter_Clone
//
//  Created by TranHao on 18/02/2024.
//

import SwiftUI

struct AuthHeaderView: View {
    let lineText1:String
    let lineText2:String
    var body: some View {
        VStack(alignment: .leading){
                Text(lineText1)
                .font(.largeTitle)
                .bold()
            
                Text(lineText2)
                .font(.largeTitle)
                .bold()

            HStack{Spacer()}
        }
        .foregroundColor(.white)
        .padding(.leading)
        .frame(height: 260)
        .frame(maxWidth: .infinity)
        .background(.blue)
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(lineText1: "A", lineText2: "String")
    }
}
