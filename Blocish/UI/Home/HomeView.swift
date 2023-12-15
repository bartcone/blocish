//
//  HomeView.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TodosView()
                .tabItem { Label("Todos", systemImage: "list.bullet") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    HomeView()
}
