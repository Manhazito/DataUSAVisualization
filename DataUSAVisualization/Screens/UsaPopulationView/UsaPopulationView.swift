//
//  UsaPopulationView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI
import Charts

struct UsaPopulationView: View {
    @State private var vm = PopulationVM(service: DataUsaService())
    
    var body: some View {
        NavigationStack {
            if vm.loading {
                ActivityIndicatorView(style: .large, tint: .green)
                    .navigationTitle("USA Population")
            } else {
                ScrollView {
                    Text("10 years evolution")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    GroupBox {
                        Chart(vm.population, id: \.year) { population in
                            LineMark(
                                x: .value("Date", population.yearDate ?? Date(), unit: .year),
                                y: .value("Population", population.population)
                            )
                        }
                        .foregroundStyle(.green)
                        .chartYScale(domain: 300_000_000...350_000_000)
                        .frame(height: 380)
                    }
                    .padding(.vertical, 24)
                    .backgroundStyle(.green.opacity(0.1))
                    
                    if let currentPopulation = vm.population.last?.population {
                        Text("Actual population: \(currentPopulation).")
                    }
                    
                    Button("See data by State") {
                        
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                    .padding().padding(.top)
                    
                    Spacer()
                }
                .scrollIndicators(.hidden)
                .scrollBounceBehavior(.basedOnSize)
                .padding()
                .navigationTitle("USA Population")
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
