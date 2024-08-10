//
//  DataUsaService.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation

struct DataUsaService {
    func getNationPopulation() async throws -> [NationalData] {
        let urlStr = "https://datausa.io/api/data?drilldowns=Nation&measures=Population"
        guard let url = URL(string: urlStr) else { throw NetworkError.badUrl}
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.badResponse }
        
        do {
            let nationalDataContainer = try JSONDecoder().decode(NationalDataContainer.self, from: data)
            return nationalDataContainer.data
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func getStatePopulation() async throws -> [NationalData] {
        []
    }
}
