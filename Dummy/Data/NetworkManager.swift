//
//  NetworkManager.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation
import Combine

final class NetworkManager<T: Codable> {
    
    // Function to fetch data from the specified URL and return a publisher
    static func fetch(from productUrl: String) -> AnyPublisher<T, NetworkError> {
        let url = URL(string: productUrl)!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
        
        // Map the publisher to extract the data
        return publisher
            .map(\.data)
        // Decode the data using the specified Codable type
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                // Handle decoding errors and map them to NetworkError
                switch error {
                case is Swift.DecodingError:
                    print(error.localizedDescription)
                    return NetworkError.invalidResponse
                default:
                    return NetworkError.nilResponse
                }
            }
        
        // Receive the publisher on the main queue
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// Error enum to represent network errors
enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}

