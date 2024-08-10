//
//  UsaPopulationView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import SwiftUI
import Charts

struct UsaPopulationView: View {
    @State private var vm = NationalDataVM(service: DataUsaService())
    
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
                        Chart(vm.nationalData, id: \.year) { data in
                            LineMark(
                                x: .value("Date", data.yearDate ?? Date(), unit: .year),
                                y: .value("Population", data.population)
                            )
                        }
                        .foregroundStyle(.green)
                        .chartYScale(domain: 300_000_000...350_000_000)
                        .frame(height: 380)
                    }
                    .padding(.vertical, 24)
                    .backgroundStyle(.green.opacity(0.1))
                    
                    if let currentPopulation = vm.nationalData.last?.population {
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
