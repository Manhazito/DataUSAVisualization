//
//  ApiConstants.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import Foundation

enum ApiConstants {
    static private let baseUrl = "https://datausa.io/api/data"
    
    static let nationDataUrl = baseUrl + "?drilldowns=Nation&measures=Population"
    static let stateDataUrl = baseUrl + "?drilldowns=State&measures=Population&year=latest"
}
