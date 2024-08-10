//
//  StateDataVM.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import Foundation
import Observation

enum SortOrder: String {
    case alphabetically
    case populationSize
}

@Observable
final class StateDataVM {
    @ObservationIgnored
    let service: DataUsaService
    
    var loading = true
    var showDialog = false
    var error: NetworkError = .unknownError {
        didSet {
            showDialog = true
        }
    }
    var sortOrder: SortOrder = .alphabetically {
        didSet {
            sortData()
        }
    }
    var stateData = [StateData]()
    var sortIcon: String {
        sortOrder == .populationSize ? "square.and.arrow.up.on.square.fill" : "a.circle.fill"
    }
    
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
            sortData()
        } catch {
            self.error = error as? NetworkError ?? .unknownError
        }
    }
    
    func switchSortingOrder() {
        sortOrder = switch sortOrder {
        case .alphabetically:
            .populationSize
        case .populationSize:
            .alphabetically
        }
    }
    
    func calculateRelativePopulations() {
        let maxPopulation: Double = Double(stateData.max { $0.population < $1.population }?.population ?? 1)
        stateData.indices.forEach { stateData[$0].relativePopulation = Double(stateData[$0].population) / maxPopulation }
    }
    
    func sortData() {
        switch sortOrder {
        case .alphabetically:
            stateData = stateData.sorted { $0.name < $1.name }
        case .populationSize:
            stateData = stateData.sorted { $0.population > $1.population }
        }
    }
}
