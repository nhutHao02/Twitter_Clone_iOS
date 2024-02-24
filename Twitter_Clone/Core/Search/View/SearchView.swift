//
//  SearchView.swift
//  Twitter_Clone
//
//  Created by TranHao on 15/02/2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    var body: some View {
            VStack{
                SearchBarView(text: $searchViewModel.searchText)
                ScrollView{
                    LazyVStack{
                        ForEach(searchViewModel.searchedUser) { user in
                            NavigationLink{
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                    .padding()
                }
            }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
