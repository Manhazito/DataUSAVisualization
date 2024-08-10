//
//  NationalData.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation

struct NationalData: Decodable {
    let nation: String
    let year: String
    let population: Int

    private enum CodingKeys : String, CodingKey {
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
    }
}

extension NationalData {
    var yearDate: Date? {
        Calendar.current.date(from: DateComponents(year: Int(year)))
    }
}
