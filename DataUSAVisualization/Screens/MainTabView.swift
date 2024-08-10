//
//  MainTabView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            UsaPopulationView()
                .tag(0)
                .tabItem { Label(
                    title: { Text("Nation") },
                    icon: { Image(systemName: "globe.americas") }
                )}
            
            StatesPopulationView()
                .tag(1)
                .tabItem { Label(
                    title: { Text("State") },
                    icon: { Image(systemName: "map") }
                )}
        }
    }
}

#Preview {
    MainTabView()
}
