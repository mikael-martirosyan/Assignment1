//
//  ContentView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 02.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Nested enumeration
    enum TabBar {
        case userListView
        case anotherView
    }
 
    // MARK: - Properties
    @State private var tabBarSelection: TabBar = .userListView
        
    
    // MARK: Body
    var body: some View {
        TabView(selection: $tabBarSelection) {
            UserListView(viewModel: UserListViewModel())
                .tabItem {
                    Label("User list", systemImage: "list.bullet")
                }
                .tag(TabBar.userListView)
             
            AnotherView()
                .tabItem {
                    Label("Another", systemImage: "star")
                }
                .tag(TabBar.anotherView)
        }
    }
}

// MARK: - ContentView_Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
