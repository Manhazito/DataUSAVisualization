//
//  NetworkError.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 09/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case decodingError
    case unknownError
}
