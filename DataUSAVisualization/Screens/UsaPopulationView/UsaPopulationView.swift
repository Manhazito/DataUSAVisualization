//
//  UsaPopulationView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI

struct UsaPopulationView: View {
    private let screenTitle = "USA Population"
    
    @State private var vm = NationalDataVM(service: DataUsaService())
    
    var body: some View {
        NavigationStack {
            if vm.loading {
                ActivityIndicatorView(style: .large, tint: .accent)
                    .navigationTitle(screenTitle)
            } else {
                ScrollView {
                    Text("10 years evolution")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    PopulationChart(nationalData: $vm.nationalData)
                    
                    if let currentPopulation = vm.nationalData.last?.population {
                        Text("Actual population: \(currentPopulation).")
                    }
                    
                    Spacer()
                }
                .scrollIndicators(.hidden)
                .padding()
                .navigationTitle(screenTitle)
                .overlay {
                    DialogView(show: $vm.showDialog,
                               title: vm.error.title,
                               message: vm.error.description)
                }
            }
        }
        .task {
            await vm.fetchPopulationData()
        }
    }
}

#Preview {
    UsaPopulationView()
}
