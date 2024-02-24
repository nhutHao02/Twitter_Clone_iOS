//
//  ContentView.swift
//  Twitter_Clone
//
//  Created by TranHao on 06/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            MainTabView()
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Circle()
                        .frame(width: 40, height: 40)
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
