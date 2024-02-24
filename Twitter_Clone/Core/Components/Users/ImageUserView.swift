//
//  ImageUserView.swift
//  Twitter_Clone
//
//  Created by TranHao on 22/02/2024.
//

import SwiftUI

struct ImageUserView: View {
    let nameIMG: String
    let typeIMG: Bool
    let size: CGFloat
    
    var body: some View {
        if typeIMG {
            AsyncImage(url: URL(string: nameIMG)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: size, height: size)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: nameIMG)
                .resizable()
                .foregroundColor(.gray)
                .background(.white)
                .clipShape(Circle())
                .frame(width: size, height: size)
        }
    }
}

struct ImageUserView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUserView(nameIMG: " ", typeIMG: true, size: 30)
    }
}
