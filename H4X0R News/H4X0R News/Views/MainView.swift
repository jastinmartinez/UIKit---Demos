//
//  MainView.swift
//  H4X0R News
//
//  Created by Jastin Martinez on 3/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager  = NetworkManager()
    var body: some View {
        
        NavigationView {
            List(networkManager.posts){
                post in
                NavigationLink(
                    destination: DetailView(url: post.url))
                {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


