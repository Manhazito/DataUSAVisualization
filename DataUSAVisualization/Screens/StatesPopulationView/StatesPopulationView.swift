//
//  StatesPopulationView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import SwiftUI

struct StatesPopulationView: View {
    private let screenTitle = "Population by State"
    
    @State private var vm = StateDataVM(service: DataUsaService())
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.loading {
                    ActivityIndicatorView(style: .large, tint: .accent)
                } else {
                    ScrollView {
                        Text("Year: \(vm.stateData.first?.year ?? "unknown")")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 24)
                            .padding(.horizontal)
                        
                        LazyVStack {
                            ForEach(vm.stateData) { stateData in
                                StateRow(stateData: stateData)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .overlay {
                        DialogView(show: $vm.showDialog,
                                   title: vm.error.title,
                                   message: vm.error.description)
                    }
                }
            }
            .navigationTitle(screenTitle)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: vm.sortIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.accent)
                        .onTapGesture {
                            vm.switchSortingOrder()
                        }
                }
            }
        }
        .task {
            await vm.fetchStateData()
        }
    }
}

#Preview {
    StatesPopulationView()
}
