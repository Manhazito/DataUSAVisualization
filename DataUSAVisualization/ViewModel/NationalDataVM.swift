//
//  NationalDataVM.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation
import Observation

@Observable
final class NationalDataVM {
    @ObservationIgnored
    let service: DataUsaService
    
    var loading = true
    var nationalData = [NationalData]()
    
    init(service: DataUsaService) {
        self.service = service
    }

    @MainActor
    func fetchPopulationData() async {
        do {
            loading = true
            defer { loading = false }

            let data = try await service.getNationPopulation()
                .compactMap { $0.yearDate != nil ? $0 : nil }

            nationalData = Array(data.prefix(10))
        } catch {
            print(error)
        }
    }
}
