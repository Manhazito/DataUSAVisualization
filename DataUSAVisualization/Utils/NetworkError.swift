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

extension NetworkError {
    var title: String {
        "Something went wrong"
    }
    
    var description: String {
        switch self {
        case .badUrl:
            "The url provided is not valid."
        case .badResponse:
            "Check your internet connection."
        case .decodingError:
            "The response from the server is not valid."
        case .unknownError:
            "Please try again later."
        }
    }
}
