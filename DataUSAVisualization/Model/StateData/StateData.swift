//
//  StateData.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import Foundation

struct StateData: Decodable {
    let state: String
    let year: String
    let population: Int

    private enum CodingKeys : String, CodingKey {
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
}

extension StateData {
    var yearDate: Date? {
        Calendar.current.date(from: DateComponents(year: Int(year)))
    }
}
