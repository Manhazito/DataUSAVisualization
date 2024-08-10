//
//  DataUsaService.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation

struct DataUsaService {
    func getNationPopulation() async throws -> [NationalData] {
        let container: NationalDataContainer = try await getData(from: ApiConstants.nationDataUrl)
        return container.data
    }
    
    func getStatePopulation() async throws -> [StateData] {
        let container: StateDataContainer = try await getData(from: ApiConstants.stateDataUrl)
        return container.data
    }
    
    private func getData<ContainerType>(from urlStr: String) async throws -> ContainerType where ContainerType: Decodable {
        guard let url = URL(string: urlStr) else { throw NetworkError.badUrl}
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.badResponse }
        
        do {
            return try JSONDecoder().decode(ContainerType.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
