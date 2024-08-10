//
//  StateDataVM.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import Foundation
import Observation

@Observable
final class StateDataVM {
    @ObservationIgnored
    let service: DataUsaService
    
    var loading = true
    var stateData = [StateData]()
    
    init(service: DataUsaService) {
        self.service = service
    }

    @MainActor
    func fetchStateData() async {
        do {
            loading = true
            defer { loading = false }

            stateData = try await service.getStatePopulation()
            calculateRelativePopulations()
        } catch {
            #warning("Show error dialog")
            print(error)
        }
    }
    
    func calculateRelativePopulations() {
        let maxPopulation: Double = Double(stateData.max { $0.population < $1.population }?.population ?? 1)
        stateData.indices.forEach { stateData[$0].relativePopulation = Double(stateData[$0].population) / maxPopulation }
    }
}
