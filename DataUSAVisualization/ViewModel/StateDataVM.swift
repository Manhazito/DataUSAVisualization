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
        } catch {
            #warning("Show error dialog")
            print(error)
        }
    }
}
