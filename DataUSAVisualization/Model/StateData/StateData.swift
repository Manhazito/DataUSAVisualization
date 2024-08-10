//
//  StateData.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import Foundation

struct StateData: Decodable, Identifiable {
    let id: String
    let name: String
    let year: String
    let population: Int
    
    var relativePopulation: Double = 1.0

    private enum CodingKeys : String, CodingKey {
        case id = "Slug State"
        case name = "State"
        case year = "Year"
        case population = "Population"
    }
}
